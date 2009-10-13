#!/usr/bin/env ruby

require 'mysql'
require 'yaml'

cfg = Yaml.load(config.yml)
TPL_DB = cfg[:templeet]
ROR_DB = cfg[:rails]

