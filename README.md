# Home weather station

This is a Sinatra application that reads temperature and humidity information
from an Arduino board and publish it through an API.

## Configuration

* You will need an Arduino board running the corresponding program (which I will
publish shortly).
* Create a configuration for the serial connection named config/serial.rb. You
  can use config/serial.rb-sample as an example. The most important setting is
the serial port, which need to match the one where your Arduino board is
connected.

## Usage

To use this program run, from the command line:

```
bundle install
rackup config.ru
```

## Authors

* Author:: Leandro Di Tommaso (<leandro.ditommaso@mikroways.net>)
