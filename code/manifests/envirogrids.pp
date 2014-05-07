# Class defining the envirogrids.vo.eu-egee.org VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the envirogrids.vo.eu-egee.org VO
# (users and services) in a grid enabled machine.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::envirogrids':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>

#unfortunately the full VO name envirogrids.vo.eu-egee.org is not a valid class name...
class voms::envirogrids {
  voms::client{'envirogrids.vo.eu-egee.org':
      servers  => [{server => 'voms.cern.ch',
                    port   => '15002',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=voms.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Trusted Certification Authority'
                   },
                   {server => 'lcg-voms.cern.ch',
                    port   => '15002',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Trusted Certification Authority'
                   },
                   {server => 'voms2.cern.ch',
                    port   => '15002',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=voms2.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority',
                   },
                   {server => 'lcg-voms2.cern.ch',
                    port   => '15002',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms2.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority',
                   }]
 }
}
