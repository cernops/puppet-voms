# Class defining the prod.vo.eu-eela.eu VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the prod.vo.eu-eela.eu VO
# (users and services) in a grid enabled machine.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::eela':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>

#unfortunately the full VO name prod.vo.eu-eela.eu is not a valid class name...
class voms::eela {
  voms::client{'prod.vo.eu-eela.eu':
      servers => [{server                   => 'voms-eela.ceta-ciemat.es',
                    port  => '15003',
                    dn    => '/DC=es/DC=irisgrid/O=ceta-ciemat/CN=host/voms-eela.ceta-ciemat.es',
                    ca_dn => '/DC=es/DC=irisgrid/CN=IRISGridCA'
                   },
                   {server                   => 'voms.grid.unam.mx',
                    port  => '15000',
                    dn    => '/C=MX/O=UNAMgrid/OU=DGSCA UNAM CU/CN=voms.grid.unam.mx',
                    ca_dn => '/C=MX/O=UNAMgrid/OU=UNAM/CN=CA'
                   }]
 }
}
