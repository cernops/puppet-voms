class voms::fusion {
  voms::client{'fusion':
    servers => [
      {
        server => 'voms-prg.bifi.unizar.es',
          port => '15001',
            dn => '/DC=es/DC=irisgrid/O=bifi-unizar/CN=voms-prg.bifi.unizar.es',
         ca_dn => '/DC=es/DC=irisgrid/CN=IRISGridCA',
      },
    ]
  }
}
