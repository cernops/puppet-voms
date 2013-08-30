# Class defining the ATLAS VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the ATLAS VO
# (users and services) in a grid enabled machine.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::atlas':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>

class voms::atlas {
  voms::client{'atlas':
      servers  => [{server => 'voms.cern.ch',
                    port   => '15001',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=voms.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Trusted Certification Authority'
                   },
                   {server => 'lcg-voms.cern.ch',
                    port   => '15001',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Trusted Certification Authority'
                   },
                   {server => 'vo.racf.bnl.gov',
                    port   => '15003',
                    dn    => '/DC=org/DC=doegrids/OU=Services/CN=vo.racf.bnl.gov',
                    ca_dn => '/DC=org/DC=DOEGrids/OU=Certificate Authorities/CN=DOEGrids CA 1'
                   }]
 }
}
