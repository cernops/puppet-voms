class voms::vo_irfu_cea_fr {
  voms::client{'vo.irfu.cea.fr':
    servers => [
      {
        server => 'grid12.lal.in2p3.fr',
          port => '20014',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=LAL/CN=grid12.lal.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
