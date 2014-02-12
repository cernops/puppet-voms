class voms::vo_apc_univ_paris7_fr {
  voms::client{'vo.apc.univ_paris7.fr':
    servers => [
      {
        server => 'grid12.lal.in2p3.fr',
          port => '20010',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=LAL/CN=grid12.lal.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
