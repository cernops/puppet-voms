class voms::lz {
  voms::client{'lz':
    servers => [
      {
        server => 'voms.hep.wisc.edu',
          port => '15001',
            dn => '/DC=com/DC=DigiCert-Grid/O=Open Science Grid/OU=Services/CN=voms.hep.wisc.edu',
         ca_dn => '/DC=com/DC=DigiCert-Grid/O=DigiCert Grid/CN=DigiCert Grid CA-1',
      },
    ]
  }
}
