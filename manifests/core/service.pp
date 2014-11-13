class voms::core::service {
   service{'voms':
     ensure     => true,
     enable     => true,
     hasstatus  => true,
     hasrestart => true,
   }
}
