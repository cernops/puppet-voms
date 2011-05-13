# Class defining resources required to use the VOMS service.
#
# == Examples
# 
# Simply include this class:
#   include voms
#
# And then enable one or more VOs by calling the 'vo' and 'server' definitions:
#   voms::vo { "MyVO": }
#
#   voms::server { 
#    "voms_MyVO_cern":
#      vo     => "MyVO",
#      server => "voms.cern.ch",
#      port   => 15001,
#      dn     => ["/DC=ch/DC=cern/OU=computers/CN=voms.cern.ch"],
#      ca_dn  => ["/DC=ch/DC=cern/CN=CERN Trusted Certification Authority"];
# 
# For most VOs, you can probably find a separate class you can include which
# does all the required setup without any additional configuration:
#   include voms::atlas
#   or
#   include voms::dteam
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
#
import '*.pp'

class voms {
  file { 
    "vomsdir":
      ensure => directory,
      path   => "/etc/grid-security/vomsdir",
      owner  => root,
      group  => root,
      mode   => 644,
      require => File["/etc/grid-security"];
    "vomses":
      ensure  => directory,
      path    => $grid_flavour ? {
        "glite" => "/opt/glite/etc/vomses",
        default => "/etc/vomses",
      },
      owner   => root,
      group   => root,
      mode    => 755,
      require => $grid_flavour ? {
        "glite" => File["glite_etc"],
        default => undef,
      };
  }
}
