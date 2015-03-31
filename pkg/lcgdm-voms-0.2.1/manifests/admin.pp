# == Define: voms::admin
# 
# Creates a voms core instance for a VO or virtual organisation.
# 
# === Parameters
# 
# [*hostname*]
#  The hostname of the voms-admin instance. By default it is the $::fqdn.
#
# [*vo*]
#  The name of virtual orgnisation. If not defined the namevar of the voms::admin intance will be used.
# 
# [*sqlhost*]
#  The name of the database host, defaults to localhost.
# 
# [*sqldbname*] 
#  The name of the database, defaults <vo_name>_db
# 
# [*sqlusername*]
#  The name of the sql user. Defaults to <vo_name>_admin
# 
# [*sqlport*]
#  Defaults to mysql default 3306 
# 
# [*sqlpwd*]
#  The sqlpassword.
# 
# [*port*]
#  Must be defined as the port the voms core service should listen.
#  This must be unique per VO however please note this uniqueness
#  is not checked by puppet.
# 
# [*mailfrom*]
#  The mailaddress from where voms-admin notification should be sent.
# 
# [*mailsmtp*]
#  The smtp server to use, default localhost.
# 
# [*config_hash*]
#  A hash of key value pairs that end up in the voms-admin properties
#  file for the service in 
#  /etc/voms-admin/<vo_name>/voms.service.properties.
#  
# === Examples
# 
# voms::admin{'atlas':
#      port     => '2000',
#      mailfrom => 'me@example.org',
#      sqlpwd   => '12345',
#      sqlhost  => 'example.mysql.example.org',
#      config_hash => {'voms.cafiles.period' => 2000,
#                      'voms.notification.smtp-server' => '127.0.0.1'
#                     }
# }
# === Authors
# Steve Traylen <steve.traylen@cern.ch>
# 
# === Copyright 
# Copyright Steve Traylen,  CERN 2012 
# 
# === License
#  Apache II
# 
define voms::admin($vo=$name,
                   $sqlhost='localhost',
                   $sqldbname="${name}_db",
                   $sqlusername="${name}_admin",
                   $sqlport=3306,
                   $port,
                   $mailfrom,
                   $mailsmtp='localhost',
                   $sqlpwd,
                   $passfile=$vo ? {
                    ''      => "/etc/voms/${name}/voms.pass",
                    default => "/etc/voms/${vo}/voms.pass"
                   },
                   $disable_registration,
                   $disable_notification,
                   $config_hash = {} ) {

       include('voms::admin::install')
       include('voms::admin::config')
       include('voms::admin::service')
       Class[Voms::Admin::Install] -> Class[Voms::Admin::Config] -> Voms::Admin[$name] -> Class[Voms::Admin::Service]


       file{"/etc/voms-admin-puppet/voms-admin-add-admin-${vo}.sh":
           ensure => file,
           content => template("voms/voms-admin-add-admin.sh.erb"),
           mode    => "0700",
       }


       file{"/etc/voms-admin-puppet/voms-admin-remove-${vo}.sh":
           ensure => file,
           content => template("voms/voms-admin-remove.sh.erb"),
           mode    => "0700",
       }

       file{"/etc/voms-admin-puppet/voms-admin-create-${vo}.sh":
           ensure => file,
           content => template("voms/voms-admin-create.sh.erb"),
           mode    => "0700",
       }

       file{"/etc/voms-admin-puppet/voms-admin-upgrade-${vo}.sh":
           ensure => file,
           content => template("voms/voms-admin-upgrade.sh.erb"),
           mode    => "0700",
       }


       file{"/etc/voms-admin-puppet/voms-admin-install-${vo}.sh":
           ensure => file,
           content => template("voms/voms-admin-install.sh.erb"),
           mode    => "0700",
           notify  => Exec["/etc/voms-admin-puppet/voms-admin-install-${vo}.sh"],
           require => Class['fetchcrl']
       }

       exec{"/etc/voms-admin-puppet/voms-admin-install-${vo}.sh":
           refreshonly => true,
           require     => [File['/etc/grid-security/vomskey.pem'],File['/etc/grid-security/vomscert.pem']],
           notify      => Service['voms-admin'],
       }


       # We need a newer proprties.aug file than SLC5 or 6 provide
       # Can be dropped hopefully at a later date providing
       # abc.def_defg = 12345
       case $::augeasversion {
         '0.9.0','0.10.0': { $lenspath = '/var/lib/puppet/lib/augeas/lenses' }
          default: { $lenspath = undef }
       }

       $augyaml = inline_template('
---
<% config_hash.each do |k,v| -%>
<%= @vo %>_<%= k %>:
   lens: Properties.lns
   incl: /etc/voms-admin/<%= @vo %>/voms.service.properties
   changes: set "<%= k %>" "<%= v %>"
   load_path: <%= @lenspath %>
   require: Exec[/etc/voms-admin-puppet/voms-admin-install-<%= @vo %>.sh]

<% end -%>
        ')

     $aughash = parseyaml($augyaml)
   
     if $aughash {
       create_resources('augeas',$aughash)
     }

       @@database_user{"${sqlusername}@${::fqdn}":
          tag           => 'voms_database_users',
          password_hash => mysql_password("${sqlpwd}"),
          require       => Class['mysql::server']
       }
       @@database_grant{"${sqlusername}@${::fqdn}/${sqldbname}":
          tag           => 'voms_database_grant',
          privileges    => ['Select_priv','Insert_priv','Update_priv','Alter_Priv','Create_Priv']
       }
}

