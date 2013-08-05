# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/middleware/json_parser'

Gem::Specification.new do |gem|
  gem.name        = 'rack-middleware-json-parser'
  gem.version     = '0.0.2'
  gem.date        = '2013-08-02'
  gem.summary     = "Rack middleware JSON parser"
  gem.description = "Rack middleware for parsing json requests."
  gem.authors     = ["Yuriy Kharchenko"]
  gem.email       = 'yuri.kharchenko@gmail.com'
  gem.homepage    = 'https://github.com/letmein/rack-middleware-json-parser'
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ["lib"]

  gem.add_dependency "oj"
end
