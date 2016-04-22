class voms::cdf {
  voms::client{'cdf':
    servers => [
      {
        server => 'voms-01.pd.infn.it',
          port => '15001',
            dn => '/C=IT/O=INFN/OU=Host/L=Padova/CN=voms-01.pd.infn.it',
         ca_dn => '/C=IT/O=INFN/CN=INFN CA',
      },
      {
        server => 'voms.cnaf.infn.it',
          port => '15001',
            dn => '/C=IT/O=INFN/OU=Host/L=CNAF/CN=voms.cnaf.infn.it',
         ca_dn => '/C=IT/O=INFN/CN=INFN CA',
      },
      {
        server => 'voms.fnal.gov',
          port => '15020',
            dn => '/DC=org/DC=opensciencegrid/O=Open Science Grid/OU=Services/CN=voms.fnal.gov',
         ca_dn => '/DC=org/DC=cilogon/C=US/O=CILogon/CN=CILogon OSG CA 1',
      },
    ]
  }
}
