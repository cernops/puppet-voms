#
# == Class: voms::isntall
# Install voms-clients package and sets up a few directories.
# 
class voms::install (
  $clientpkgs = $voms::params::clientpkgs
) inherits voms::params {

  #package { $clientpkgs:
  #  ensure  => present, 
  #}

  file{'/etc/grid-security/vomsdir':
              ensure  => directory,
              owner   => root,
              group   => root,
              mode    => 0755,
              purge   => true,
              recurse => true,
              force   => true, #because voms::client creates subdirectories, we need force=true to remove them when purging
  }                   
  file{'/etc/vomses':
             ensure  => directory,
             owner   => root,
             group   => root,
             mode    => 0755,
             purge   => true,
             recurse => true,
  }                   

}
