class voms::dzero {
  voms::client{'dzero':
    servers => [
      {
        server => 'voms.fnal.gov',
          port => '15002',
            dn => '/DC=org/DC=opensciencegrid/O=Open Science Grid/OU=Services/CN=voms.fnal.gov',
         ca_dn => '/DC=org/DC=cilogon/C=US/O=CILogon/CN=CILogon OSG CA 1',
      },
    ]
  }
}
