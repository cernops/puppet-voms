class voms::magic {
  voms::client{'magic':
    servers => [
      {
        server => 'voms01.pic.es',
          port => '15003',
            dn => '/DC=org/DC=terena/DC=tcs/C=ES/ST=Barcelona/L=Bellaterra/O=Port dInformacio Cientifica/CN=voms01.pic.es',
         ca_dn => '/C=NL/ST=Noord-Holland/L=Amsterdam/O=TERENA/CN=TERENA eScience SSL CA 3',
      },
      {
        server => 'voms02.pic.es',
          port => '15003',
            dn => '/DC=org/DC=terena/DC=tcs/C=ES/ST=Barcelona/L=Bellaterra/O=Port dInformacio Cientifica/CN=voms02.pic.es',
         ca_dn => '/C=NL/ST=Noord-Holland/L=Amsterdam/O=TERENA/CN=TERENA eScience SSL CA 3',
      },
    ]
  }
}
