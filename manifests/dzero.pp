class voms::dzero {
  voms::client{'dzero':
    servers => [
      {
        server => 'voms.fnal.gov',
          port => '15002',
            dn => '/DC=org/DC=doegrids/OU=Services/CN=http/voms.fnal.gov',
         ca_dn => '/DC=org/DC=DOEGrids/OU=Certificate Authorities/CN=DOEGrids CA 1',
      },
    ]
  }
}
