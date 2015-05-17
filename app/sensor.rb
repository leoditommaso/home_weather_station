require_relative 'sensor_source'

module HomeWeatherStation
  class Sensor

    attr_reader   :id
    attr_accessor :description, :humidity, :temperature

    def initialize(id, description)
      @id = id
      @description = description
      @humidity = -1
      @temperature = -1
    end

    def to_hash
      sensor = {}
      sensor[self.id] = {}
      sensor[self.id][:description] = self.description
      sensor[self.id][:humidity] = self.humidity
      sensor[self.id][:temperature] = self.temperature
      sensor
    end

  end
end
