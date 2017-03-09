#http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b1b15e88fa797225412429c1c50c122a1

require 'net/http'
require 'json'
require 'pp'

# url = 'http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b1b15e88fa797225412429c1c50c122a1'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# pp JSON.parse(response)

def get_weather(name)
    #url = 'http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp&appid=b1b15e88fa797225412429c1c50c122a1'
    url = 'http://api.openweathermap.org/data/2.5/weather?q=Soeul,kr&appid=c64fc3bf3a17ec1edd28765eb1bf1a30'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    result["weather"]
end
puts get_weather("Soeul")