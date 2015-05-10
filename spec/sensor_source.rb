require_relative '../app/sensor'

describe 'Sensor source class.' do

  it 'should return a Runtime Error exception when trying to read from an invalid source.' do
    expect { HomeWeatherStation::SensorSource::read_from(:invalid) }.to raise_error(RuntimeError)
  end

end
