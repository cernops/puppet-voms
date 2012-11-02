# Class defining a VOMS client, install all required packages.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::client':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
#
class voms::client {

  package { "voms-clients": 
    name    => $grid_flavour ? {
      "glite" => "glite-security-voms-clients",
      default => "voms-clients",
    },
    ensure  => latest, 
    notify  => $grid_flavour ? {
      "glite" => Exec["glite_ldconfig"],
      default => undef,
    },
    require => Package["lcg-CA"],
  }

}
