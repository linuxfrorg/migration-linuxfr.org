#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'yaml'
require 'sequel'
require 'redis'

$stdout.sync = true

cfg = YAML.load_file('config.yml')
TPL = Sequel.mysql2(cfg['templeet'])
TPL.run('set names latin1')
ROR = Sequel.mysql2(cfg['rails'])
RED = Redis.new

# hack
def nil.force_encoding(*args)
  nil
end

load "lib/constants.rb"
load "lib/utils.rb"
load "lib/truncate_html.rb"
load "lib/users.rb"
load "lib/sections.rb"
load "lib/news.rb"
load "lib/links.rb"
load "lib/diaries.rb"
load "lib/forums.rb"
load "lib/posts.rb"
load "lib/polls.rb"
load "lib/tags.rb"
load "lib/comments.rb"
load "lib/relevances.rb"
load "lib/votes.rb"
load "lib/interest.rb"

