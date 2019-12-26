class voms::calice {
  voms::client{'calice':
    servers => [
      {
        server => 'grid-voms.desy.de',
          port => '15102',
            dn => '/C=DE/O=GermanGrid/OU=DESY/CN=host/grid-voms.desy.de',
         ca_dn => '/C=DE/O=GermanGrid/CN=GridKa-CA',
      },
    ]
  }
}
