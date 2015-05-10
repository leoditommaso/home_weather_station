require_relative '../app/sensor'

describe 'Home Weather Station API.' do
  it 'should return a page not found error when accessing the home page.' do
    get '/'
    expect(last_response).to_not be_ok
  end

  describe 'API valid URLs and methods.' do
    it 'should response to requirements to api/status with 200 OK.' do
      get '/api/status'
      expect(last_response).to be_ok
    end

    it 'should response to requirements to api/temperature with 200 OK.' do
      get '/api/temperature'
      expect(last_response).to be_ok
    end

    it 'should response to requirements to api/humidity with 200 OK.' do
      get '/api/humidity'
      expect(last_response).to be_ok
    end
  end

  describe 'API content type return value.' do
    it 'should return a JSON when accessing api/status.' do
      get '/api/status'
      expect(last_response.headers['Content-Type']).to eq('application/json')
    end

    it 'should return a JSON when accessing api/temperature.' do
      get '/api/temperature'
      expect(last_response.headers['Content-Type']).to eq('application/json')
    end

    it 'should return a JSON when accessing api/humidity.' do
      get '/api/humidity'
      expect(last_response.headers['Content-Type']).to eq('application/json')
    end
  end

end

