# Class defining the SEE VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the lhcb VO
# (users and services) in a grid enabled machine.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::see':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>

class voms::see {
  voms::client{'see':
      servers => [{ server => 'voms.hellasgrid.gr',
                    port   => '15004',
                    dn    => '/C=GR/O=HellasGrid/OU=hellasgrid.gr/CN=voms.hellasgrid.gr',
                    ca_dn => '/C=GR/O=HellasGrid/OU=Certification Authorities/CN=HellasGrid CA 2006'
                  },
                  { server => 'voms2.hellasgrid.gr',
                    port   => '15004',
                    dn    => '/C=GR/O=HellasGrid/OU=hellasgrid.gr/CN=voms2.hellasgrid.gr',
                    ca_dn => '/C=GR/O=HellasGrid/OU=Certification Authorities/CN=HellasGrid CA 2006'
                 }]
  }
}

