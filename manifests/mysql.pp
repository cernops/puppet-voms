#
# ==  Class: voms::mysql
#
# Sets a mysql database for use with voms. In particular it collects
# from exported resources their required grants and access. The
# voms::admin and voms::core creates the exported resources.
#
# === Parameters
#
# [*vo_dbs*]
# A simple array of databases to create.
#
# === Examples
#
#  voms::mysql{['atlas_db','cms_db','alice_db':]}
# 
# 
class voms::mysql ($vo_dbs = [])  {


    database{$vo_dbs:
       ensure  => present,
       charset => 'latin1'
    }

    Database_grant <<|tag == 'voms_database_grant' |>>
    Database_user  <<|tag == 'voms_database_users' |>>

}
