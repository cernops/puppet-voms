class voms::biomed {
  voms::client{'biomed':
    servers => [
      {
        server => 'cclcgvomsli01.in2p3.fr',
          port => '15000',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=CC-IN2P3/CN=cclcgvomsli01.in2p3.fr',
         ca_dn => '/C=FR/O=MENESR/OU=GRID-FR/CN=AC GRID-FR Services',
      },
    ]
  }
}
