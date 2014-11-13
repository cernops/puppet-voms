class voms::core::config {

 file{'/etc/voms':
   ensure  => directory,
   mode    => '0755',
   owner   => 'root',
   group   => 'root',
   purge   => true,
   recurse => true
 }

 file{'/etc/voms/.globus':
     ensure => directory,
     require => File['/etc/voms']
 }
 # The host key must be owned by the voms user.
 file{'/etc/grid-security/hostkey.pem':
     ensure => file,
     mode   => '0600',
     owner  => voms,
     group  => root,
     content => "Should be a hostkey, will not be overwritten by puppet if this file exists\n",
     replace => false,
     show_diff => false
 }


 file{'/etc/voms/.globus/usercert.pem':
     ensure  => file,
     source  => 'file:///etc/grid-security/hostcert.pem',
      owner   => voms,
      group   => voms,
      mode    => '0644',
      notify  => Service['voms'], 
  }
  file{'/etc/voms/.globus/userkey.pem':
      ensure  => file,
      source  => 'file:///etc/grid-security/hostkey.pem',
      owner   => voms,
      group   => voms,
      mode    => '0600',
      show_diff => false,
      notify  => Service['voms'], 
  }
        
  file {'/usr/lib64/voms':
      ensure  => link,
      target  => '/usr/lib64',
      replace => false,
      before  => Service['voms'],
      require => Package['voms-mysql-plugin'],
  }
}
