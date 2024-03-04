module OpenWeatherMap
  class Api
    include HTTParty
    base_uri 'https://api.openweathermap.org/data/'

    def forecast(lat: 0, lon: 0)
      self.class.get('/2.5/forecast', {
        query: {
          lat: lat,
          lon: lon,
          units: 'metric',
          appid: ENV['OWM_KEY']
        }
      })
    end
  end
end
