require 'rubygems'
require 'bundler/setup'
require 'rack/test'
require 'rack/middleware/json_parser'

RSpec.configure do |conf|

  conf.include Rack::Test::Methods

end

