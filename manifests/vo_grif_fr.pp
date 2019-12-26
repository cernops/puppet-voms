class voms::vo_grif_fr {
  voms::client{'vo.grif.fr':
    servers => [
      {
        server => 'grid12.lal.in2p3.fr',
          port => '20001',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=LAL/CN=grid12.lal.in2p3.fr',
         ca_dn => '/C=FR/O=MENESR/OU=GRID-FR/CN=AC GRID-FR Services',
      },
    ]
  }
}
