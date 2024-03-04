module OpenWeatherMap
  class GetForecastService < ApplicationService
    attr_reader :lat, :lon

    def initialize(lat: 0, lon: 0)
      @lat = lat
      @lon = lon
    end

    def call
      open_weather_map = Api.new
      forecast = open_weather_map.forecast(lat: @lat, lon: @lon)
      simplified_forecast = forecast['list'].map do |el|
        {
          date: el['dt_txt'].to_date,
          temperatue: el['main']['temp']
        }
      end

      week_forecast = simplified_forecast.group_by do |el|
        el[:date]
      end

      week_forecast.map do |day|
        ordered_temp = day[1].sort_by { |el| el['temperatue'] }
        [ordered_temp.first[:temperatue], ordered_temp.last[:temperatue]]
      end
    end
  end
end
