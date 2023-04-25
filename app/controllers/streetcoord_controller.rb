class StreetcoordController < ApplicationController

  def street_blank

  render({:template => "/address/street_form.html.erb"})
  end

  def street_calc
    require "open-uri"
    require "json"
    require "date"

    gmaps_token = ENV.fetch("GMAPS_KEY")
    street_address = params.fetch(:user_street_address)

    gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=#{street_address}&key=#{gmaps_token}"
    raw_response = URI.open(gmaps_api_endpoint).read
    parsed_response = JSON.parse(raw_response)
    results_array = parsed_response.fetch("results")
    first_result = results_array.at(0)
    geo = first_result.fetch("geometry")
    loc = geo.fetch("location")

    @latitude = loc.fetch("lat")
    @longitude = loc.fetch("lng")
    @street_output = street_address

  render({:template => "/address/street_results.html.erb"})
  end


  def coords_blank

    render({:template => "/address/coords_form.html.erb"})
  end

  def coords_calc
    require "open-uri"
    require "json"
    require "date"

    latitude = params.fetch(:user_latitude)
    longitude = params.fetch(:user_longitude)

    weather_token = ENV.fetch("PIRATE_WEATHER_KEY")
    weather_api_endpoint = "https://api.pirateweather.net/forecast/#{weather_token}/#{latitude},#{longitude}"
    raw_response = URI.open(weather_api_endpoint).read
    parsed_response = JSON.parse(raw_response)  

    currently = parsed_response.fetch("currently")
        temperature = currently.fetch("temperature")
        summary = currently.fetch("summary")

    hourly = parsed_response.fetch("hourly")
    hourly_data = hourly.fetch("data")
    hour_one_data = hourly_data.at(1)
        hour_one_summary = hour_one_data.fetch("summary")

    hour_ten_data = hourly_data.at(11)
        hour_ten_summary = hour_ten_data.fetch("summary")

    daily = parsed_response.fetch("daily")
    daily_data = daily.fetch("data")
    day_six_data = daily_data.at(6)
            day_six_summary = day_six_data.fetch("summary")

    @lat = latitude
    @lon = longitude
    @temp = temperature
    @summ = summary
    @sixty = hour_one_summary
    @several_hours = hour_ten_summary
    @several_days = day_six_summary


  render({:template => "/address/coords_results.html.erb"})
  end


end
