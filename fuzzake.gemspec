# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fuzzake/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Denis Lutz"]
  gem.email         = ["denis.lutz@gmail.com"]
  gem.description   = %q{Fuzzake is a small library to integrate it with your rake file to be able to run rake taks in a fuzzy way.}
  gem.summary       = %q{Fuzzake makes it possible to run your rake tasks in a fuzzy way.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fuzzake"
  gem.require_paths = ["lib"]
  gem.version       = Fuzzake::VERSION
end
