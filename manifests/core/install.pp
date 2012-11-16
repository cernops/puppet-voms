class voms::core::install (
   $corepkgs = $voms::params::corepkgs
) inherits voms::params {

   package{$corepkgs:
      ensure => present,
      before => File['/etc/voms']
   }
   file{'/etc/voms':
         ensure  => directory,
         mode    => '0755',
         owner   => 'root',
         group   => 'root',
         purge   => true,
         recurse => true
   }

}
