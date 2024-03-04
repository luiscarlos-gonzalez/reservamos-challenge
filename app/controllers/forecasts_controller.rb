class ForecastsController < ApplicationController
  def index
    init_cookie
    @cities = JSON.parse cookies[:cities]
  end

  def create
    init_cookie
    place = search_place(query: forecast_params).call
    forecast = get_forecast(lat: place['lat'].to_f, lon: place['lon'].to_f).call
    cities = cities_from_cookie
    cities << city(name: place['display'], forecast: forecast)
    cookies[:cities] = cities.to_json

    redirect_to root_path
  end

  private

  def init_cookie
    cookies[:cities] = '[]' if cookies[:cities].nil?
  end

  def cities_from_cookie
    JSON.parse cookies[:cities]
  end

  def city(name: '', forecast: [])
    {
      name: name,
      forecast: forecast
    }
  end

  def forecast_params
    params.require(:query)
  end

  def search_place(query: '')
    Reservamos::SearchPlaceService.new(query)
  end

  def get_forecast(lat: 0, lon: 0)
    OpenWeatherMap::GetForecastService.new(lat: lat, lon: lon)
  end
end
