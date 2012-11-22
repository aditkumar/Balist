require 'sinatra'
require 'pg'

get '/list' do 	
	erb :index
end