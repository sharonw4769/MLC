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


    
    @user_result_with_gif = get_gif(@user_result[:weather])
    puts @user_result_with_gif
    # @user_final_gif = url(@user_result_with_gif)
    erb :result
  end
  
end
