class Sensor

  require_relative 'serial_access'

  attr_reader :humidity, :temperature

  def initialize
    update_humidity
    update_temperature
  end

  #
  # Arduino program returns a CSV where the first item is the humidity and the second one the temperature.
  #

  def update_all
    serial_port = open_serial_connection
    @humidity = serial_port.gets.chomp.split(",").first
    @temperature = serial_port.gets.chomp.split(",").last
    serial_port.close
  end

  def update_humidity
    serial_port = open_serial_connection
    @humidity = serial_port.gets.chomp.split(",").first
    serial_port.close
  end

  def update_temperature
    serial_port = open_serial_connection
    @temperature = serial_port.gets.chomp.split(",").last
    serial_port.close
  end

end
