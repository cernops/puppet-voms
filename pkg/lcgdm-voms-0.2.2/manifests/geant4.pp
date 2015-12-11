# Class defining the geant4 VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the GEANT4 VO
# (users and services) in a grid enabled machine.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::geant4':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>

class voms::geant4 {
  voms::client{'geant4':
      servers  => [{server => 'voms.cern.ch',
                    port   => '15007',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=voms.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Trusted Certification Authority'
                   },
                   {server => 'lcg-voms.cern.ch',
                    port   => '15007',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Trusted Certification Authority'
                   },
                   {server => 'voms2.cern.ch',
                    port   => '15007',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=voms2.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority',
                   },
                   {server => 'lcg-voms2.cern.ch',
                    port   => '15007',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms2.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority',
                   }]
 }
}
