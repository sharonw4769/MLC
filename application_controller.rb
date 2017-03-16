# shotgun -p $PORT -o $IP
require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    puts params #Return user input back to the terminal
    city_name = params[:city_name] #Return the City name to the terminal
    country_name = params[:country_name]#Return the Country name to the terminal
    @user_result = get_weather(city_name, country_name)#Variable that holds what the user types in to show weather info
    @user_result_with_gif = get_gif(@user_result[:weather])#Variable that gets put into result.erb to show the gif
    puts @user_result_with_gif
    erb :result
  end
  
end
