# Defines a new VOMS server in the setup, for a particular VO.
#
# == Parameters
#
# [*vo*]
#   The name of the VO
#
# [*server*]
#   The address (dns) of the server machine
#
# [*port*]
#   The port where the VOMS service is listening
#
# [*dn*]
#   The distinguished name (DN) of the VOMS server machine
#
# [*ca_dn*]
#   The distinguished name (DN) of the certificate authority (CA) issuing
#   the VOMS server DN
#
# == Example
#
# Simply invoke the definition with the name of the VO to enable:
#   voms::server { 
#    "voms_MyVO_cern":
#      vo     => "MyVO",
#      server => "voms.cern.ch",
#      port   => 15001,
#      dn     => ["/DC=ch/DC=cern/OU=computers/CN=voms.cern.ch"],
#      ca_dn  => ["/DC=ch/DC=cern/CN=CERN Trusted Certification Authority"];
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PES/PS <it-dep-pes-ps@cern.ch>

define voms::server($vo, $server, $port, $dn, $ca_dn) {

  $vomsprefix = $grid_flavour ? {
         "glite" => '/opt/glite/etc/vomses',
         default => '/etc/vomses'
  }
  ensure_resource('file',"${vomsprefix}",
                     { ensure => directory,
                       owner  => root,
                       group  => root,
                       mode   => 0644,
                       purge  => true
                     }
                 )


  ensure_resource('file',"/etc/grid-security/vomsdir/${vo}",
                     { ensure => directory,
                       owner  => root,
                       group  => root,
                       mode   => 0644,
                       purge  => true,
                       require => File['/etc/grid-security/vomsdir']
                     }
                 )
  ensure_resource('file','/etc/grid-security/vomsdir',
                     { ensure => directory,
                       owner  => root,
                       group  => root,
                       mode   => 0644,
                       purge  => true,
                     }
                 )
                                   

  file {
    "voms_lsc_$vo-$server":
      path    => "/etc/grid-security/vomsdir/$vo/$server.lsc",
      owner   => root,
      group   => root,
      mode    => 644,
      content => template("voms/lsc.erb"),
      require => File["/etc/grid-security/vomsdir/${vo}"]
  }
  file{"vomses_$vo-$server":
      path    =>  "${vomsprefix}/${vo}-${server}",
      owner   => root,
      group   => root,
      mode    => 644,
      content => template("voms/vomses.erb"),
      require => File["${vomsprefix}"]
  }
}
