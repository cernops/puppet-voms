class voms::admin::service (
   $tomcatservice = $voms::params::tomcatservice
   ) inherits params {
   service{'tomcat':
     name       => "${tomcatservice}",
     ensure     => true,
     enable     => true,
     hasstatus  => true,
     hasrestart => true,
   }

   service{'voms-admin':
     ensure     => true,
     enable     => true,
     hasstatus  => true,
     hasrestart => false,
     require    => Service['tomcat']
   }


}
