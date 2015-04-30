class voms::harpo_cea_fr {
  voms::client{'harpo.cea.fr':
    servers => [
      {
        server => 'grid12.lal.in2p3.fr',
          port => '20024',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=LAL/CN=grid12.lal.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
