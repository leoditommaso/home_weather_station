require_relative 'sensor_source'

module HomeWeatherStation
  class Sensor

    attr_reader :humidity, :temperature

    def initialize
      update_all
    end

    def update_all
      values = HomeWeatherStation::SensorSource::read_from(:serial)
      @humidity = values[:humidity]
      @temperature = values[:temperature]
    end

    def update_humidity
      values = HomeWeatherStation::SensorSource::read_from(:serial)
      @humidity = values[:humidity]
    end

    def update_temperature
      values = HomeWeatherStation::SensorSource::read_from(:serial)
      @temperature = values[:temperature]
    end

  end
end
