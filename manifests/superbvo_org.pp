class voms::superbvo_org {
  voms::client{'superbvo.org':
    servers => [
      {
        server => 'voms-02.pd.infn.it',
          port => '15009',
            dn => '/C=IT/O=INFN/OU=Host/L=Padova/CN=voms-02.pd.infn.it',
         ca_dn => '/C=IT/O=INFN/CN=INFN CA',
      },
      {
        server => 'voms2.cnaf.infn.it',
          port => '15009',
            dn => '/C=IT/O=INFN/OU=Host/L=CNAF/CN=voms2.cnaf.infn.it',
         ca_dn => '/C=IT/O=INFN/CN=INFN CA',
      },
    ]
  }
}
