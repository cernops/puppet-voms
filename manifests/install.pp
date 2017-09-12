#
# == Class: voms::isntall
# Install voms-clients package and sets up a few directories.
# 
class voms::install {
  package { "voms-clients": 
    ensure  => latest, 
    require => Package["lcg-CA"],
  }

  file{'/etc/grid-security/vomsdir':
              ensure  => directory,
              owner   => root,
              group   => root,
              mode    => "0755",
              purge   => true,
              recurse => true,
              require => Package["lcg-CA"],
  }                   
  file{'/etc/vomses':
             ensure  => directory,
             owner   => root,
             group   => root,
             mode    => "0755",
             purge   => true,
             recurse => true,
             require => Package["lcg-CA"],
  }                   

}
