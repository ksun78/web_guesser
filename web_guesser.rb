require 'sinatra'
require 'sinatra/reloader'

get '/' do 
	num = rand(100)
	"The number is #{num}"
end

