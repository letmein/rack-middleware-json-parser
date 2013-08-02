require 'spec_helper'

describe Rack::Middleware::JsonParser do

  let(:inner_app) do
    proc { |env| [200, {'Content-Type' => 'text/plain'}, [env['rack.json'] || 'ok']] }
  end

  let(:app) { described_class.new(inner_app) }

  context "with Content-Type: application/json" do
    context "requested via GET" do
      before do
        get '/', {}, 'CONTENT_TYPE' => 'application/json'
      end

      it "should not parse json" do
        last_response.should be_ok
        last_response.body.should eq 'ok'
      end
    end

    context "requested via POST" do
      before do
        post '/', '{"foo":"bar"}', 'CONTENT_TYPE' => 'application/json'
      end

      it "should parse json" do
        last_response.should be_ok
        last_response.body.should eq '{:foo=>"bar"}'
      end
    end

    context "requested via PUT" do
      before do
        put '/', '{"foo":"bar"}', 'CONTENT_TYPE' => 'application/json'
      end

      it "should parse json" do
        last_response.should be_ok
        last_response.body.should eq '{:foo=>"bar"}'
      end
    end

    context "with invalid JSON" do
      it "should raise error" do
        expect { post '/', '{"foobar"}', 'CONTENT_TYPE' => 'application/json' }.to raise_error(Rack::Middleware::JsonParser::Error)
      end
    end
  end

  context "with non-json Content-Type" do
    context "requested via GET" do
      before do
        get '/', {}, 'CONTENT_TYPE' => 'text/plain'
      end

      it "should not parse json" do
        last_response.should be_ok
        last_response.body.should eq 'ok'
      end
    end

    context "requested via POST" do
      before do
        post '/', 'foobar', 'CONTENT_TYPE' => 'text/plain'
      end

      it "should not parse json" do
        last_response.should be_ok
        last_response.body.should eq 'ok'
      end
    end

    context "requested via PUT" do
      before do
        put '/', 'foobar', 'CONTENT_TYPE' => 'text/plain'
      end

      it "should not parse json" do
        last_response.should be_ok
        last_response.body.should eq 'ok'
      end
    end
  end

end

