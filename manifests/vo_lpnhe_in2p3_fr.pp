class voms::vo_lpnhe_in2p3_fr {
  voms::client{'vo.lpnhe.in2p3.fr':
    servers => [
      {
        server => 'grid12.lal.in2p3.fr',
          port => '20008',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=LAL/CN=grid12.lal.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
