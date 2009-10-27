#!/usr/bin/env ruby

require 'yaml'
require 'sequel'

$stdout.sync = true

cfg = YAML.load_file('config.yml')
TPL = Sequel.mysql(cfg['templeet'])
ROR = Sequel.mysql(cfg['rails'])

load "lib/constants.rb"
load "lib/utils.rb"
load "lib/users.rb"
load "lib/sections.rb"
load "lib/news.rb"
load "lib/links.rb"
load "lib/diaries.rb"
load "lib/forums.rb"
load "lib/posts.rb"
load "lib/polls.rb"
load "lib/interviews.rb"
load "lib/tags.rb"
load "lib/comments.rb"
load "lib/relevances.rb"
load "lib/votes.rb"

puts_wikify_stats

