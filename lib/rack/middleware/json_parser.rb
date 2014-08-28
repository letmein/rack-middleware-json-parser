require 'oj'

module Rack
  module Middleware
    class JsonParser
      class Error < StandardError; end

        attr_reader :app

        def initialize(app)
          @app = app
        end

        def call(env)
          if env['CONTENT_TYPE'] and
             env['CONTENT_TYPE'].include?('application/json') and
             %w[put post patch].include?(env['REQUEST_METHOD'].downcase)
            input = env['rack.input']
            input.rewind
            env['rack.json'] = Oj.load(input.read, symbol_keys: true)
          end
          app.call(env)
        rescue Oj::ParseError
          raise Error
        end
    end
  end
end
