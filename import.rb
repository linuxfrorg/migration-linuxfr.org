#!/usr/bin/env ruby

require 'yaml'
require 'sequel'

$stdout.sync = true

cfg = YAML.load_file('config.yml')
TPL = Sequel.mysql(cfg['templeet'])
ROR = Sequel.mysql(cfg['rails'])

load "import/users.rb"

