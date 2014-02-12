class voms::vo_neugrid_eu {
  voms::client{'vo.neugrid.eu':
    servers => [
      {
        server => 'voms.gnubila.fr',
          port => '15001',
            dn => '/O=GRID-FR/C=FR/O=MAATG/CN=voms.gnubila.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
