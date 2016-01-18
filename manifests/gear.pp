# Class defining the vo.gear.cern.ch VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the vo.gear.cern.ch VO
# (users and services) in a grid enabled machine.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::gear':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>

#unfortunately the full VO name vo.gear.cern.ch is not a valid class name...
class voms::gear {
  voms::client{'vo.gear.cern.ch':
      servers => [{server                   => 'voms2.cern.ch',
                    port  => '15008',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=voms2.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority',
                   },
                   {server                   => 'lcg-voms2.cern.ch',
                    port  => '15008',
                    dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms2.cern.ch',
                    ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority',
                   }]
 }
}
