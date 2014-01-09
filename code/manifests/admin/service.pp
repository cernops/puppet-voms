class voms::admin::service (
   $tomcatservice = $voms::params::tomcatservice
   ) inherits params {

   service{'voms-admin':
     ensure     => true,
     enable     => true,
     hasstatus  => true,
     hasrestart => false,
     start      => '/sbin/service voms-admin start && /bin/sleep 2m',
     status     => '/usr/bin/curl --max-time 10  -s http://localhost:8088/status'
   }

}
