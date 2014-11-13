class voms::admin::install (
   $adminpkgs = $voms::params::adminpkgs,
   $emirepo = $voms::params::emirepo,
   $emiupdatesrepo = $voms::params::emiupdatesrepo,
   $tomcatuser = $voms::params::tomcatuser,
   $tomcatservice = $voms::params::tomcatservice,
) inherits voms::params {

   package{$adminpkgs:
      ensure => present,
      require => Yumrepo['EMI-3-base']
   }

   class{'emirepos::emi3repositories': before => Package['voms-mysql-plugin']}

}
