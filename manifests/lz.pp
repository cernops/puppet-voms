class voms::lz {
  voms::client{'lz':
    servers => [
      {
        server => 'voms.hep.wisc.edu',
          port => '15001',
            dn => '/DC=org/DC=opensciencegrid/O=Open Science Grid/OU=Services/CN=voms.hep.wisc.edu',
         ca_dn => '/DC=org/DC=cilogon/C=US/O=CILogon/CN=CILogon OSG CA 1',
      },
    ]
  }
}
