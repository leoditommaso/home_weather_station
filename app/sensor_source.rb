require 'serialport'

module HomeWeatherStation
  class SensorSource

    def self.class_name_from(symbol)
      eval(symbol.to_s.capitalize)
    end

    def self.is_a_valid(source)
      begin
        self.class_name_from(source).ancestors.include?(eval(self.name))
      rescue NameError
        false
      end
    end

    def self.read_from(source)
      raise "#{source.to_s} is not a valid source!" unless is_a_valid(source)
      HomeWeatherStation::SensorSource::class_name_from(source)::read_values
    end

  end

  class Serial < SensorSource

    def self.read_values
      # Port will probably change.
      settings = HomeWeatherStation::Application::settings
      sensor = {}
      SerialPort.open(settings.serial_port, settings.serial_baud_rate, settings.serial_data_bits, settings.serial_stop_bits, settings.serial_parity) do |serial_port|
        serial_port.gets
        sensor[:humidity] = serial_port.gets.chomp.split(",").first
        sensor[:temperature] = serial_port.gets.chomp.split(",").last
      end
      sensor
    end

  end
end
