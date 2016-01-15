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
  file{"/usr/share/voms-admin":
    ensure  => directory,
  }

  $memsize = to_bytes($::memorytotal) / ( 2 * 1000000 )

  if $::virtualorgs  {
    $permsize = 64 + ( 25 * size(split($::virtualorgs,' '))) 
  } else  {
    $permsize = 64 + 25 
  }

  file{'/etc/grid-security/vomscert.pem':
    ensure  => file,
    source  => 'file:///etc/grid-security/hostcert.pem',
    owner   => voms,
    group   => voms,
    mode    => '0644',
    notify  => Service['voms-admin'], 
  }
  file{'/etc/grid-security/vomskey.pem':
    ensure  => file,
    source  => 'file:///etc/grid-security/hostkey.pem',
    owner   => voms,
    group   => voms,
    mode    => '0600',
    notify  => Service['voms-admin'], 
  }
  firewall{'100 allow https to VOMS-admin UI':
    proto  => 'tcp',
    dport  => '8443',
    action => 'accept',
  }
  # Put the conanical hostname in voms properties file.
  augeas{'set_canonical_name':
    context => "/files/etc/voms-admin/voms-admin-server.properties",
    changes => "set host ${host}",
    lens    => "Properties.lns",
    incl    => '/etc/voms-admin/voms-admin-server.properties',
    notify  => Service['voms-admin']
  }
}
