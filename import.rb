#!/usr/bin/env ruby

require 'mysql'
require 'yaml'

cfg = YAML.load_file('config.yml')
TPL_DB = cfg['templeet']
ROR_DB = cfg['rails']
TPL = Mysql::new(TPL_DB['host'], TPL_DB['username'], TPL_DB['password'], TPL_DB['database'])
TPL.options(Mysql::SET_CHARSET_NAME, 'utf8')
ROR = Mysql::new(ROR_DB['host'], ROR_DB['username'], ROR_DB['password'], ROR_DB['database'])
ROR.options(Mysql::SET_CHARSET_NAME, 'utf8')

# Users
ROR.query("BEGIN")
st1 = ROR.prepare("INSERT INTO users(id,name,homesite,jabber_id,role,created_at,updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)")
st2 = ROR.prepare("INSERT INTO accounts(id,user_id,login,email,state,created_at,updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)")
res = TPL.query("SELECT * FROM users")
res.each do |id,lname,fname,login,passwd,email,homesite,level,param,created,theme,status,score,lastseen,ip,sig,jabber_id|
  name  = [lname, fname].compact
  name  = name.empty? ? login : name.join(' ')
  state = status.to_i == 0 ? "deleted" : "active"
  st1.execute(id, name, homesite, jabber_id, 'moule', created, lastseen)
  st2.execute(id, id, login, email, state, created, created)
end
ROR.query("COMMIT")
# TODO password
# TODO role
# TODO check the values of the autoincrement on id

