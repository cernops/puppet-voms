# Class defining the DELPHI/LEP VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the DELPHI VO
# (users and services) in a grid enabled machine.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::ilc':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>

class voms::delphi {
  voms::client{'vo.delphi.cern.ch':
      servers  => [{server => 'voms2.cern.ch',
                    port   => '15002',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=voms2.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
                   },
                   {server => 'lcg-voms2.cern.ch',
                    port   => '15002',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms2.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
                   },
                  ]
  }
}
