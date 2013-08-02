rack-middleware-json-parser
============

Simple rack middleware class that parses JSON requests and puts the result to env['rack.json']


Gemfile
```ruby
gem "rack-middleware-json-parser", "~> 0.0.1", :require => "rack/middleware/json_parser"
```

Usage example for Siantra/Padrino:

In app.rb
```ruby
use Rack::Middleware::JsonParser
```

In a controller
```ruby
put '/the/action' do
  my_json = env['rack.json']
  my_json[:foo][:bar]
end
```

