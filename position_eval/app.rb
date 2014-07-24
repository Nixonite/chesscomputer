require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/cross_origin'

require 'json'


configure do
  enable :cross_origin
  set :protection, :except => [:json_csrf]
end

# get the next game not marked as done
get "/evaluate" do
	content_type :json
	puts params["fen"]
	result = `./stockfish-src/stockfish #{params["fen"]}`
	{"evaluation" => result}.to_json
end