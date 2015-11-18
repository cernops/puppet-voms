class voms::na62_vo_gridpp_ac_uk {
  voms::client{'na62.vo.gridpp.ac.uk':
    servers => [
      {
        server => 'voms.gridpp.ac.uk',
          port => '15501',
            dn => '/C=UK/O=eScience/OU=Manchester/L=HEP/CN=voms.gridpp.ac.uk',
         ca_dn => '/C=UK/O=eScienceCA/OU=Authority/CN=UK e-Science CA 2B',
      },
      {
        server => 'voms02.gridpp.ac.uk',
          port => '15501',
            dn => '/C=UK/O=eScience/OU=Oxford/L=OeSC/CN=voms02.gridpp.ac.uk',
         ca_dn => '/C=UK/O=eScienceCA/OU=Authority/CN=UK e-Science CA 2B',
      },
      {
        server => 'voms03.gridpp.ac.uk',
          port => '15501',
            dn => '/C=UK/O=eScience/OU=Imperial/L=Physics/CN=voms03.gridpp.ac.uk',
         ca_dn => '/C=UK/O=eScienceCA/OU=Authority/CN=UK e-Science CA 2B',
      },         
    ]
  }
}
