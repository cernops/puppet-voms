# Class defining the ILC VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the ILC VO
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

class voms::ilc {
  voms::client{'ilc':
      servers  => [{server => 'grid-voms.desy.de',
                    port   => '15110',
                    dn    => '/C=DE/O=GermanGrid/OU=DESY/CN=host/grid-voms.desy.de',
                    ca_dn => '/C=DE/O=GermanGrid/CN=GridKa-CA'
                   }]
 }
}
