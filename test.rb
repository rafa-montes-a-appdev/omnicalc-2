require "open-uri"
require "json"
require "date"

latitude = 30
longitude = 30

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

#@lat = latitude
#@lon = longitude
#@temp = temperature
#@summ = summary
#@sixty = hour_one_summary
#@several_hours = hour_ten_summary
#@several_days = day_six_summary
