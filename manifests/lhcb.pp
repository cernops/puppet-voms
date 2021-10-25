# Class defining the lhcb VO, as seen by the VOMS service.
#
# Takes care of all the required setup to enable access to the lhcb VO
# (users and services) in a grid enabled machine.
#
# == Examples
#
# Simply enable this class:
#   class{'voms::lhcb':}
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PS/PES <it-dep-ps-pes@cern.ch>
# Adam Boutcher IPPP, Durham University <adam.j.boutcher@durham.ac.uk>

class voms::lhcb {
  voms::client{'lhcb':
      servers  => [{server => 'voms2.cern.ch',
                    port   => '15003',
                    dn     => '/DC=ch/DC=cern/OU=computers/CN=voms2.cern.ch',
                    ca_dn  => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
                   },
                   {server => 'lcg-voms2.cern.ch',
                    port   => '15003',
                    dn     => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms2.cern.ch',
                    ca_dn  => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
                   },
                   {server => 'voms-lhcb-auth.app.cern.ch',
                    port   => '0',
                    dn     => '/DC=ch/DC=cern/OU=computers/CN=lhcb-auth.web.cern.ch',
                    ca_dn  => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
                   }]
 }
}
