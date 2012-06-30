#!/usr/bin/env rake

require "bundler/gem_tasks"
require_relative 'lib/fuzzake.rb'

include Fuzzake

desc "Default will build the project"
task :default => "fuzzake:call"


desc "Dummy task to test fuzzake"
task :dummy do
  puts "Dummy task executed!"
end
