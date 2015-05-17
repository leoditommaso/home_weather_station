require_relative 'sensor'
require_relative '../config/sensors'

module HomeWeatherStation
  class SensorManager

    # Create an array of sensors as specified in config/sensors.rb
    # and initializes every sensor with correct information.
    def self.create_sensors
      sensors = HomeWeatherStation::Application::settings.sensors.map do |sensor|
        Sensor.new(sensor[:id], sensor[:description])
      end
      self.update_all(sensors)
    end

    def self.update_all(sensors)
      sensors_data = HomeWeatherStation::SensorSource::read_from(:serial).split(';')
      sensors.each do |sensor|
        sensor_values = sensors_data[sensor.id].split(',')
        sensor.humidity = sensor_values[1]
        sensor.temperature = sensor_values[2]
      end
    end

  end
end
