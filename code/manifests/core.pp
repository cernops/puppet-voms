# === Define: voms::core
#
# Installs and configure a voms core server
#
# === Parameters
#
# [*vo*]
#  The name of the virtial organisation. Defaults to the namevar of the
#  the  voms::core instance.
#  
# [*issuer*]
#  The hostname of issuer of voms credentials. By default it is the $::fqdn.
# 
# [*vomstimeout*]
#  The timeout of voms proxy, by default 86400 seconds or 1 day.
#
# [*sqlhost*, *sqldbname*, *sqlport*, *sqlusername*, *sqlpw*]
#  The SQL server parameters, see default values below.
#
# [*port*]
#  The port the voms server should listen on.
#
# === Examples
# 
#   voms::core{'examplevo':
#        issuser => 'voms.example.org',
#        sqlpwd  => '12345',
#        sqlhost => 'mysql.example.org.'
#   }
#
# === Authors
# Steve Traylen <steve.traylen@cern.ch>
# 
# === Copyright 
# Copyright Steve Traylen,  CERN 2012 
# 
# === License
#  Apache II
# 



define voms::core($vo=$name,
                  $port,
                  $issuer=$::fqdn,
                  $vomstimeout="86400",
                  $sqlhost='localhost',
                  $sqldbname="${name}_db",
                  $sqlport=3306,
                  $sqlusername="${name}_core",
                  $sqlpwd) {

       include("voms::${name}")
       include('voms::core::install')
       include('voms::core::config')
       include('voms::core::service')
       Class[Voms::Core::Install] -> Voms::Core[$name] -> Class[Voms::Core::Service]

      
       firewall {"100 allow ${name} access from the universe.":
           proto   => 'tcp',
           dport   => $port,
           action  => 'accept'
       }

       file{"/etc/voms/${vo}":
           ensure  => directory,
           mode    => "0755",
           owner   => "root",
           group   => "root",
           purge   => true,
           recurse  => true,
           require => File['/etc/voms']
       }

       file{"/etc/voms/${vo}/voms.conf":
         ensure  => file,
         content => template('voms/voms.conf.erb'),
         mode    => "0644",
         owner   => "root",
         group   => "root",
         notify  => Service["voms"],
         require => File["/etc/voms/${vo}"]
       }
       # The package creates the voms user below.
       file{"/etc/voms/${vo}/voms.pass":
         ensure  => file,
         content => "${sqlpwd}\n",
         mode    => "0640",
         owner   => "voms",
         group   => "voms",
         notify  => Service["voms"],
         require => [File["/etc/voms/${vo}"],Package['voms-server']]
       }
       @@database_user{"${sqlusername}@${::fqdn}":
          tag           => 'voms_database_users',
          password_hash => mysql_password("${sqlpwd}"),
          require       => Class['mysql::server']
       }
       @@database_grant{"${sqlusername}@${::fqdn}/${sqldbname}":
          tag           => 'voms_database_grant',
          privileges    => ['Select_priv']
       }
}
