class voms::dune {
  voms::client{'dune':
    servers => [
      {
          server => 'voms2.fnal.gov',
          port   => '15042',
          dn     => '/DC=org/DC=incommon/C=US/ST=IL/L=Batavia/O=Fermi Research Alliance/OU=Fermilab/CN=voms2.fnal.gov',
          ca_dn  => '/C=US/O=Internet2/OU=InCommon/CN=InCommon IGTF Server CA',
      },
      {
          server => 'voms1.fnal.gov',
          port   => '15042',
          dn     => '/DC=org/DC=opensciencegrid/O=Open Science Grid/OU=Services/CN=voms1.fnal.gov',
          ca_dn  => '/DC=org/DC=cilogon/C=US/O=CILogon/CN=CILogon OSG CA 1',
      },
    ]
  }
}
