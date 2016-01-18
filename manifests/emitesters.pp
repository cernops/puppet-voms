class voms::emitesters {
  voms::client{
  'testers.eu-emi.eu':
          servers => [{ server                   => 'emitestbed07.cnaf.infn.it',
                    port  => '15002',
                    dn    => '/C=IT/O=INFN/OU=Host/L=CNAF/CN=emitestbed07.cnaf.infn.it',
                    ca_dn => '/C=IT/O=INFN/CN=INFN CA'
                  }];
  'testers2.eu-emi.eu':
          servers => [{ server                   => 'emitestbed27.cnaf.infn.it',
                    port  => '15005',
                    dn    => '/C=IT/O=INFN/OU=Host/L=CNAF/CN=emitestbed27.cnaf.infn.it',
                    ca_dn => '/C=IT/O=INFN/CN=INFN CA'
                  }]
  }
}

