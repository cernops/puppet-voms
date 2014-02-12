class voms::zeus {
  voms::client{'zeus':
    servers => [
      {
        server => 'grid-voms.desy.de',
          port => '15112',
            dn => '/C=DE/O=GermanGrid/OU=DESY/CN=host/grid-voms.desy.de',
         ca_dn => '/C=DE/O=GermanGrid/CN=GridKa-CA',
      },
    ]
  }
}
