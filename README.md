## cernops-voms puppet module

This module manages VOMS resources for VOMS clients, VOMS core and VOMS Admin.

VOMS is the Virtual Organization Membership Service, in use by gLite, EMI, and
other grid computing projects.

## Examples
### Client Examples
Create files for the voms-proxy-init and voms-proxy-validate.

     voms::client{'MyVO':
        vo       => 'MyVO',
        servers  => [{server => 'voms2.cern.ch',
                      port   => '15009',
                      dn     => '/DC=ch/DC=cern/OU=computers/CN=voms2.cern.ch',
                      ca_dn  => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
                     },
                     {server => 'lcg-voms2.cern.ch',
                      port   => '15009',
                       dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms2.cern.ch',
                       ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
                     }]

 The above declaration will create the files:

     /etc/vomses/MyVO/voms2.cern.ch
 and

     /etc/grid-security/vomsdir/MyVO/voms2.cern.ch.lsc


 For some VOs, you can probably find a predefined class to enable a
 VO easily which does all the required setup without any 
 additional configuration e.g:

     class{'voms::atlas':}
     class{'voms::dteam':}

Additions of new VOs will be accepted, please submit pull requests
however zero validation of parameters will be made.

### A VOMS Core Example
VOMS core is the main voms service and responds to voms-proxy-init requests.
To configure a VOMS core services for two VOs.

     # Configure defaults.
     Voms::Core{
         issuer => 'voms.example.org',
         sqlpwd => 12345,
         sqlhost => 'mysql.example.org'
     }
     # Configure VOs.
     voms::core{'special.vo': port => 10000}
     voms::core{'very.special.vo': port => 10001}

For full list of available parameters see voms::core definition.

### A VOMS Admin Example
VOMS admin is the tomcat hosted webservice for managing  a Virtual Organisation.
To configure a few  VOMS admin for a number of VOs.

     # Configure defaults.
     Voms::Admin{
        sqlpwd => 12345,
        sqlhost => 'mysql.example.org'
     }
     voms::admin{'special.vo': 
        port => 10000,
        mailfrom => 'whoever@example.org'
     }
     voms::admin{'very.special.vo': 
        port     => 10001,
        mailfrom => 'specialman@example.org',
        config_hash => {'voms.cafiles.period' => 2000,
                      'voms.notification.smtp-server' => '127.0.0.1'
                     }
     }

For full list of available paramters see voms::admin definition.

The voms::admin definition will not update or load database schemas
however scripts are generated within /etc/voms-admin-puppet to 
allow this to be done. e.g:

    /etc/voms-admin-puppet/voms-admin-create-very.special.vo.sh 

will create a schema for the 'very.special.vo'
   
## Database Configuration
VOMS admin and voms core require a database per VO. At this time this 
puppet module only supports mysql. A mysql server can be 
configured using puppetlabs-mysql module. 
The Mysql users and access grants are exported as puppet resources from the 
above voms::admin and voms::core declarations. Assuming default database
names of <voname>_db for each VO the following manifest will install
and configure mysql with all grant tables suitable for VOMS and VOMS-Admin
services to connect to.

     class{'mysql::server': }
     class{'voms::mysql':
           vo_dbs => ['special.vo_db','very.special.vo_db']
     }
  
This assumes your puppet service is configured to support 
export resources.


### Todo
Configure tomcat and trustmanager outside this VOMS 
module so other services can use it.

Use the existing EMI yum repo puppet module rather than manage myself.

Add some validation of items that are passed to voms admin with config hash,
currently they will be blindly added to the voms.service.properties files.

## Authors
 CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>, Ricardo Rocha
 CERN IT/PS/PES <it-dep-ps-pes@cern.ch>, Steve Traylen
 Bugs, Comments, Pull requests - https://github.com/cernops/puppet-voms



