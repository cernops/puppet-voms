class voms::admin::config (
   $tomcatuser = $voms::params::tomcatuser,
   $tomcatservice = $voms::params::tomcatservice,
   $trustmanager_logging = $voms::params::trustmanager_logging,
   $tomcat_filelimit = $voms::params::tomcat_filelimit
) inherits voms::params {

   file{"/etc/voms-admin-puppet":
      ensure  => directory,
      purge   => true,
      recurse => true
   }
   file{"/etc/voms-admin-puppet/README":
      ensure   => file,
      content  => template('voms/README.erb'),
      require  => File["/etc/voms-admin-puppet"]
   }
   file{"/etc/grid-security/tomcat-hostcert.pem":
      ensure => file,
      source => "file:///etc/grid-security/hostcert.pem", 
      mode   => 0644,
      owner  => $tomcatuser,
      group  => root,
      notify => Service['tomcat']
   }
   file{"/etc/grid-security/tomcat-hostkey.pem":
      ensure => file,
      source => "file:///etc/grid-security/hostkey.pem", 
      mode   => 0400,
      owner  => $tomcatuser,
      group  => root,
      notify => Service['tomcat']
   }
   file{"/etc/${tomcatservice}/server.xml":
       ensure => file,
       content => template('voms/server.xml.erb'),
       mode    => 0644,
       owner   => root,
       group   => root,
       notify  => Service['tomcat']
   }
   file{"/etc/${tomcatservice}/log4j-trustmanager.properties":
       ensure => file,
       content => template('voms/log4j-trustmanager.properties.erb'),
       mode    => 0644,
       owner   => root,
       group   => root,
       notify  => Service['tomcat']
   }
   file{"/usr/share/voms-admin":
       ensure  => directory,
   }


   $tomcat_server_lib = '/usr/share/tomcat6/lib'

   exec{"/usr/bin/build-jar-repository ${tomcat_server_lib} bcprov":
       creates => "${tomcat_server_lib}/[bcprov].jar",
       notify   => Service['tomcat'],
   }

   exec{"/usr/bin/build-jar-repository ${tomcat_server_lib} trustmanager":
       creates => "${tomcat_server_lib}/[trustmanager].jar",
       notify   => Service['tomcat']

   }
   exec{"/usr/bin/build-jar-repository ${tomcat_server_lib} trustmanager-tomcat":
       creates => "${tomcat_server_lib}/[trustmanager-tomcat].jar",
       notify   => Service['tomcat']
   }
   exec{"/usr/bin/build-jar-repository ${tomcat_server_lib} commons-logging":
       creates => "${tomcat_server_lib}/[commons-logging].jar",
       notify   => Service['tomcat']
   }
   exec{"/usr/bin/build-jar-repository ${tomcat_server_lib} javamail":
       creates => "${tomcat_server_lib}/[javamail].jar",
       notify   => Service['tomcat']
   }


   $memsize = to_bytes($::memorytotal) / ( 2 * 1000000 )

   if $::virtualorgs  {
       $permsize = 64 + ( 25 * size(split($::virtualorgs,' '))) 
   } else  {
       $permsize = 64 + 25 
   }

   file{"/etc/${tomcatservice}/${tomcatservice}.conf":
       ensure => file,
       content => template("voms/${tomcatservice}.conf.erb"),
       mode => 0644,
       owner => root,
       group => root,
       notify => Service['tomcat']
   }
   if $tomcat_filelimit {
     file{"/etc/security/limits.d/90-tomcat.conf":
         ensure => file,
         owner  => root,
         group  => root,
         mode   => 0644,
         content => "tomcat   soft  nofile ${tomcat_filelimit}\ntomcat hard nofile ${tomcat_filelimit}\n"
     }
   }
}
