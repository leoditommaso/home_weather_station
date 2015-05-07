# Ruby program that reads from a serial device and provides
# a very simple API using Sinatra to read temperature and humidity
# from an Arduino board.

# Our local files.
require_relative 'sensor'

# Some Gems we need.
require 'json'
require 'rufus-scheduler'
require 'sinatra'

# Create sensors.
dining_room = Sensor.new

# API thread.
Thread.new do

  get '/api/status' do
    "{\"humidity\": \"#{dining_room.humidity}\", \"temperature\": \"#{dining_room.temperature}\" }"
  end

  get '/api/humidity' do
    "Humidity is #{dining_room.humidity}"
  end

  get '/api/temperature' do
    "Temperature is #{dining_room.temperature}"
  end

  get '/api/update/temperature' do
    dining_room.update_temperature
  end

  get '/api/update/humidity' do
    dining_room.update_humidity
  end

  get '/api/update/all' do
    dining_room.update_all
  end

end

# Background update sensor information.
Thread.new do

  scheduler = Rufus::Scheduler.new

  scheduler.every '30s' do
    dining_room.update_all
  end

end
