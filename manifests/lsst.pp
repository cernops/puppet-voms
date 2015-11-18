class voms::lsst {
  voms::client{'lsst':
    servers => [
      {
        server => 'voms.fnal.gov',
          port => '15003',
            dn => '/DC=com/DC=DigiCert-Grid/O=Open Science Grid/OU=Services/CN=voms.fnal.gov',
         ca_dn => '/DC=com/DC=DigiCert-Grid/O=DigiCert Grid/CN=DigiCert Grid CA-1',
      },
      {
        server => 'voms2.fnal.gov',
          port => '15003',
            dn => '/DC=com/DC=DigiCert-Grid/O=Open Science Grid/OU=Services/CN=voms2.fnal.gov',
         ca_dn => '/DC=com/DC=DigiCert-Grid/O=DigiCert Grid/CN=DigiCert Grid CA-1',
      },
      {
        server => 'voms1.fnal.gov',
          port => '15003',
            dn => '/DC=com/DC=DigiCert-Grid/O=Open Science Grid/OU=Services/CN=voms1.fnal.gov',
         ca_dn => '/DC=com/DC=DigiCert-Grid/O=DigiCert Grid/CN=DigiCert Grid CA-1',
      },

    ]
  }
}
