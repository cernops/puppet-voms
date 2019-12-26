class voms::esr {
  voms::client{'esr':
    servers => [
      {
        server => 'voms.grid.sara.nl',
          port => '30001',
            dn => '/O=dutchgrid/O=hosts/OU=sara.nl/CN=voms.grid.sara.nl',
         ca_dn => '/C=NL/O=NIKHEF/CN=NIKHEF medium-security certification auth',
      },
    ]
  }
}
