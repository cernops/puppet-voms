class voms::vo_formation_idgrilles_fr {
  voms::client{'vo.formation.idgrilles.fr':
    servers => [
      {
        server => 'cclcgvomsli01.in2p3.fr',
          port => '15012',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=CC-IN2P3/CN=cclcgvomsli01.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
