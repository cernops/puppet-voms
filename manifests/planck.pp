class voms::planck {
  voms::client{'planck':
    servers => [
      {
        server => 'voms.cnaf.infn.it',
          port => '15002',
            dn => '/C=IT/O=INFN/OU=Host/L=CNAF/CN=voms.cnaf.infn.it',
         ca_dn => '/C=IT/O=INFN/CN=INFN Certification Authority',
      },
    ]
  }
}
