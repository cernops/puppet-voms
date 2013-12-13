class voms::vo_llr_in2p3_fr {
  voms::client{'vo.llr.in2p3.fr':
    servers => [
      {
        server => 'grid12.lal.in2p3.fr',
          port => '20007',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=LAL/CN=grid12.lal.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
