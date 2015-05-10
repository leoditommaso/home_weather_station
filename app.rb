# Ruby program that reads from a serial device and provides
# a very simple API using Sinatra to read temperature and humidity
# from an Arduino board.

# Some Gems we need.
require 'json'
require 'rufus-scheduler'
require 'sinatra'

# Our local files.
require_relative 'app/sensor'
require_relative 'config/serial.rb'


module HomeWeatherStation
  class Application < Sinatra::Application

    # Create sensor.
    sensor = Sensor.new

    # API thread.
    Thread.new do

      get '/api/status', provides: 'json' do
        { humidity: sensor.humidity, temperature: sensor.temperature }.to_json
      end

      get '/api/humidity', provides: 'json' do
        { humidity: sensor.humidity }.to_json
      end

      get '/api/temperature', provides: 'json' do
        { temperature: sensor.temperature }.to_json
      end

      get '/api/update/temperature' do
        sensor.update_temperature
      end

      get '/api/update/humidity' do
        sensor.update_humidity
      end

      get '/api/update/all' do
        sensor.update_all
      end

    end

    # Background update sensor information.
    Thread.new do

      scheduler = Rufus::Scheduler.new

      scheduler.every '30s' do
        sensor.update_all
      end

    end

  end
end
