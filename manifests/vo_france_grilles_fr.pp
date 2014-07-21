class voms::vo_france_grilles_fr {
  voms::client{'vo.france-grilles.fr':
    servers => [
      {
        server => 'cclcgvomsli01.in2p3.fr',
          port => '15017',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=CC-IN2P3/CN=cclcgvomsli01.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
