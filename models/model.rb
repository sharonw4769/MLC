#http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b1b15e88fa797225412429c1c50c122a1 --->(JSON for Weather API)
# shotgun -p $PORT -o $IP
# http://jsonviewer.stack.hu/#http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC--->(JSON for Gif API)
require 'net/http'
require 'json'
require 'pp'

def get_weather(city_name, country_name) 
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{city_name},#{country_name}&appid=c64fc3bf3a17ec1edd28765eb1bf1a30"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    weather = JSON.parse(response)
    convert = -457 + ((1.8 * weather["main"]["temp"])-2) #Convert Kelvin to Fahrenheit
{
:weather => weather["weather"][0]["main"], :description => weather["weather"][0]["description"], :temp => convert.round 
} #Hash that stores data for Weather,Temp and Description
end


def get_gif(weather)
url = "http://api.giphy.com/v1/gifs/search?q=#{weather}&api_key=dc6zaTOxFJmzC"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    gif = JSON.parse(response)
   gif["data"][0]["images"]["fixed_height"]["url"] #Hash that holds the Gif Images
end
