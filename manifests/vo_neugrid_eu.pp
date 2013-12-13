class voms::vo_neugrid_eu {
  voms::client{'vo.neugrid.eu':
    servers => [
      {
        server => 'voms.maatg.eu',
          port => '15001',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=CC-IN2P3/CN=cclcgvomsli01.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
