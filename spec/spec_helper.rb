require 'rack/test'
require 'rspec'
require 'sinatra'
require 'mocha/mini_test'

# Application main file.
require_relative '../app'

ENV['RACK_ENV'] = 'test'

include Rack::Test::Methods

def app
  HomeWeatherStation::Application
end

RSpec.configure do |config|
  config.tty = true
  config.formatter = :documentation
  config.include Rack::Test::Methods
end

require_relative 'api'
require_relative 'sensor_source'
