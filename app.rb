# Ruby program that reads from a serial device and provides
# a very simple API using Sinatra to read temperature and humidity
# from an Arduino board.

# Some Gems we need.
require 'json'
require 'rufus-scheduler'
require 'sinatra'

# Our local files.
require_relative 'app/sensor'
require_relative 'app/sensor_manager'
require_relative 'config/serial'


module HomeWeatherStation
  class Application < Sinatra::Application

    # Create sensors.
    sensors = HomeWeatherStation::SensorManager.create_sensors

    # API thread.
    Thread.new do

      get '/api/:id/status', provides: 'json' do
        sensors[params['id'].to_i].to_hash.to_json
      end

      get '/api/status', provides: 'json' do
        sensors_information = {}
        sensors.each do |sensor|
          sensors_information.merge! sensor.to_hash
        end
        sensors_information.to_json
      end

      get '/api/:id/humidity', provides: 'json' do
        { params['id'] => { humidity: sensors[params['id'].to_i].humidity } }.to_json
      end

      get '/api/:id/temperature', provides: 'json' do
        { params['id'] => { temperature: sensors[params['id'].to_i].temperature } }.to_json
      end

      get '/api/update/all' do
        HomeWeatherStation::SensorManager.update_all(sensors)
      end

    end

    # Background update sensor information.
    Thread.new do

      scheduler = Rufus::Scheduler.new

      scheduler.every '30s' do
        HomeWeatherStation::SensorManager.update_all(sensors)
      end

    end

  end
end
