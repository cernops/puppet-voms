#
# == Class: voms::params
#
# Various centric parameters for installing and configuring voms and voms admin.
#
class voms::params {

  # Voms Core Related.
  $clientpkgs = hiera('voms_clientpkgs',['voms-clients-cpp'])
  $corepkgs  = ['voms-server','voms-mysql-plugin']
  $host = hiera('lcgvoms_voms_issuer', $::fqdn)

  # Voms Admin Related.
  $adminpkgs        = ['voms-admin-server','voms-admin-client']
  $emirepo         = "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/${::architecture}/base/"
  $emiupdatesrepo  = "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/${::architecture}/updates/"
  $adminrepowhite   = ['voms-admin-server','voms-admin-client','emi-trustmanager-tomcat','emi-trustmanager']
  $trustmanager_logging   = 'INFO' # should be info.
  $tomcat_filelimit  = '16384'
  

  # Tomcat related.
  $tomcatservice  = 'tomcat6'
  $tomcatuser     = 'tomcat'

}
