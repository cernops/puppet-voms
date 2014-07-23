class voms::vo_hess_experiment_eu {
  voms::client{'vo.hess-experiment.eu':
    servers => [
      {
        server => 'grid12.lal.in2p3.fr',
          port => '20021',
            dn => '/O=GRID-FR/C=FR/O=CNRS/OU=LAL/CN=grid12.lal.in2p3.fr',
         ca_dn => '/C=FR/O=CNRS/CN=GRID2-FR',
      },
    ]
  }
}
