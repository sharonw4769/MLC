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
    puts params
    city_name = params[:city_name]
    country_name = params[:country_name]
    @user_result = get_weather(city_name, country_name)
    erb :result
  end
  post '/result' do
    puts params
    value = params[:value]
    gif = params[:gif]
    @user_result_with_gif = get_gif(value, gif)
    erb :result
  end
  
end
