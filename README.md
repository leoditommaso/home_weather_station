# Home weather station

This is a Sinatra application that reads temperature and humidity information
from an Arduino board and publish it through an API.

## Configuration

* You will need an Arduino board running the corresponding program (which I will
publish shortly).
* Connect your Arduino board through serial port and replace, in
  app/serial_access.rb file, the variable port_str to match the USB port where
Arduino board is connected.

## Usage

To use this program run, from the command line:

```
bundle install
ruby app/home_weather_station.rb
```

## License

The MIT License (MIT)

Copyright (c) 2015 Leandro Di Tommaso

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Authors

* Author:: Leandro Di Tommaso (<leandro.ditommaso@mikroways.net>)
