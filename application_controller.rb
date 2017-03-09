#shotgun -p $PORT -o $IP
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
    country_id = params[:weather]
    @country = get_weather(country_id)
    erb :result
  end
  
end
