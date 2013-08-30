class voms::admin::install (
   $adminpkgs = $voms::params::adminpkgs,
   $emirepo = $voms::params::emirepo,
   $emiupdatesrepo = $voms::params::emiupdatesrepo,
   $tomcatuser = $voms::params::tomcatuser,
   $tomcatservice = $voms::params::tomcatservice,
) inherits voms::params {

   package{$adminpkgs:
      ensure => present,
      require => Yumrepo['emi']
   }

   yumrepo{"emi":
      descr       => "EMI Repository for voms-admin at least.",
      baseurl     => "${emirepo}",
      gpgcheck    => 0,
      enabled     => 1,
      priority    => 100,
      includepkgs => join($adminrepowhite,','),
      require     => Yumrepo['emiupdates']

   }
   yumrepo{"emiupdates":
      descr       => "EMI Updates Repository for voms-admin at least.",
      baseurl     => "${emiupdatesrepo}",
      gpgcheck    => 0,
      enabled     => 1,
      priority    => 100,
      includepkgs => join($adminrepowhite,',')

   }

   file{"/etc/yum.repos.d/emi.repo":
      ensure => file,
      require => Yumrepo["emi"]
   }
   file{"/etc/yum.repos.d/emiupdates.repo":
      ensure => file,
      require => Yumrepo["emiupdates"]
   }


}
