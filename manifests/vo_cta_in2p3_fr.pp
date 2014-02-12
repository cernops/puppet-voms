class voms::vo_cta_in2p3_fr {
  voms::client{'vo.cta.in2p3.fr':
    servers => [
      {
        server => 'cclcgvomsli01.in2p3.fr',
          port => '15008',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=CC-IN2P3/CN=cclcgvomsli01.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
