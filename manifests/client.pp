# == Define: voms::client

# Configures a VOMS client with the two files 
# /etc/vomses/... as used by voms-proxy-init.
# /etc/grid-security/vomsdir/... as used 
# == Parameters
#
# [*vo*]
#   The name of the VO, if no *vo* is specifed
#   the name of the instance will be used.

# [*servers*]
#   An array of hashes. For each VOMS server 
#   specify server name (server), its port (port), 
#   its distinguished name (dn) and it's certificate 
#   authority distinguished name (ca_dn) as keys to the hash.

# == Example
#
#     voms::client{'ops':
#        servers  => [{server => 'voms2.cern.ch',
#                   port   => '15009',
#                   dn    => '/DC=ch/DC=cern/OU=computers/CN=voms2.cern.ch',
#                   ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
#                  },
#                  {server => 'lcg-voms2.cern.ch',
#                   port   => '15009',
#                   dn    => '/DC=ch/DC=cern/OU=computers/CN=lcg-voms2.cern.ch',
#                   ca_dn => '/DC=ch/DC=cern/CN=CERN Grid Certification Authority'
#                  }]
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
# CERN IT/PES/PS <it-dep-pes-ps@cern.ch>
#
define voms::client ($vo = $name, $servers = []  ) {
   ensure_resource('class','voms::install')
   Class[Voms::Install] -> Voms::Client[$vo]

   file {"/etc/grid-security/vomsdir/${vo}":
                   ensure  => directory,
                   owner   => root,
                   group   => root,
                   mode    => "0755", 
                   recurse => true,
                   purge   => true,
                   require => File['/etc/grid-security/vomsdir']
  }

  # Set defaults for the rest of this scope.
  File{
     owner => root,
     group => root,
     mode  => "0644"
  }
  

  $yaml = inline_template('
---
<% @servers.each do |s| -%>
/etc/grid-security/vomsdir/<%= @vo %>/<%= s["server"] %>.lsc:
   content: "<%= s["dn"] %>\n<%= s["ca_dn"] %>\n"
   require: File[/etc/grid-security/vomsdir/<%= @vo %>]

/etc/vomses/<%= @vo %>-<%= s["server"] %>:
   content: "\"<%= @vo %>\" \"<%= s["server"] %>\" \"<%= s["port"] %>\" \"<%= s["dn"] %>\" \"<%= @vo %>\" \"24\"\n"
   require: File[/etc/vomses]

<% end -%>

  ')

   $filedata = parseyaml($yaml)
   create_resources('file',$filedata)


}
