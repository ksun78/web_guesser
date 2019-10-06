require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
	# erb :index, :locals => {:number => number}
	guess = params['guess']
	message, background_color = check_message(guess.to_i)
	erb :index, :locals => {:number => settings.number, :message => message, :background_color => background_color}
end

def check_message(guess)
	difference = (guess - settings.number).abs
	if difference > 25
		if guess > settings.number
			return "Too high!", "red"
		end
		if guess < settings.number
			return "Too low!", "red"
		end
	elsif difference <= 25 && difference > 0
		if guess > settings.number
			return "Too high", "darksalmon"
		else
			return "Too low", "darksalmon"
		end
	else
		return "Correct!", "green"
	end
end


