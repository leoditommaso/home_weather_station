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
      settings = HomeWeatherStation::Application::settings
      serial_raw_data = ""
      SerialPort.open(settings.serial_port, settings.serial_baud_rate, settings.serial_data_bits, settings.serial_stop_bits, settings.serial_parity) do |serial_port|
        serial_port.sync = true
        # Do some reads to synchronize with the serial port.
        serial_port.readline "EOI\r\n"
        serial_raw_data = serial_port.readline("EOI\r\n").chomp("EOI\r\n")
      end
      serial_raw_data
    end

  end
end
