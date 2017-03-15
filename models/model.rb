#http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b1b15e88fa797225412429c1c50c122a1
# shotgun -p $PORT -o $IP
require 'net/http'
require 'json'
require 'pp'



# url = 'http://api.openweathermap.org/data/2.5/weather?q=Brooklyn,us&appid=c64fc3bf3a17ec1edd28765eb1bf1a30'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# weather = JSON.parse(response)
# pp JSON.parse(response)
# # puts weather["weather"] # puts the information for weather
# # puts weather["name"] # puts name of city 
# # puts weather["weather"][0]["description"] # puts description
# puts weather["main"]["temp"] #puts temp




def get_weather(city_name, country_name)
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{city_name},#{country_name}&appid=c64fc3bf3a17ec1edd28765eb1bf1a30"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    weather = JSON.parse(response)
    convert = -457 + ((1.8 * weather["main"]["temp"])-2)
{:weather => weather["weather"][0]["main"], :description => weather["weather"][0]["description"], :temp => convert.round }


end




# url = "http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"
# uri = URI(url)
# response = Net::HTTP.get(uri)
# gif = JSON.parse(response)
# pp JSON.parse(response)
# puts gif[""]

#puts get_weather("Brooklyn","us")

