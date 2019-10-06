require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
	# erb :index, :locals => {:number => number}
	guess = params['guess']
	message = check_message(guess.to_i)
	erb :index, :locals => {:number => settings.number, :message => message}
end

def check_message(guess)
	if guess < settings.number
		return "Too low!"
	elsif guess > settings.number
		return "Too high!"
	else
		return "Correct!"
	end
end


