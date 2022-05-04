# Class defining the ops VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the ATLAS VO
# (users and services) in a grid enabled machine.
#
# == Examples
# 
# Simply enable this class:
#   class{'voms::cms':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>
# Adam Boutcher IPPP, Durham University <adam.j.boutcher@durham.ac.uk>

class voms::cms {
  voms::client{'cms':
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
                   {server => 'voms-cms-auth.app.cern.ch',
                    port   => '0',
                    dn     => '/DC=ch/DC=cern/OU=computers/CN=cms-auth.web.cern.ch',
                    ca_dn  => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
                   }]
 }
}
