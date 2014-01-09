class voms::core::install (
   $corepkgs = $voms::params::corepkgs
) inherits voms::params {

   package{$corepkgs:
      ensure => present,
      before => File['/etc/voms']
   }

}
