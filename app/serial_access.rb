#
# Required logic to implement serial port access.
#

require "serialport"

def open_serial_connection
  # Port will probably change.
  port_str = "/dev/tty.usbmodem1411"
  baud_rate = 9600
  data_bits = 8
  stop_bits = 1
  parity = SerialPort::NONE
  sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
  sp.gets
  sp
end
