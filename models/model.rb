#http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b1b15e88fa797225412429c1c50c122a1
#shotgun -p $PORT -o $IP
require 'net/http'
require 'json'
require 'pp'


# url = 'http://api.openweathermap.org/data/2.5/weather?q=Brooklyn,us&appid=c64fc3bf3a17ec1edd28765eb1bf1a30'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# weather = JSON.parse(response)
# #pp JSON.parse(response)
# puts weather["weather"] # puts the information for weather
# puts weather["name"] # puts name of city 


def get_weather(city_name, country_name)
    #url = 'http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp&appid=b1b15e88fa797225412429c1c50c122a1'
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{city_name},#{country_name}&appid=c64fc3bf3a17ec1edd28765eb1bf1a30"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    weather = JSON.parse(response)
    weather["weather"][0]["main"] 

end
 #puts get_weather("Brooklyn","us")

