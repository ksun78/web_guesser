require 'sinatra'
require 'sinatra/reloader'

@@tries = 5

@@number = rand(100)

get '/' do
	# erb :index, :locals => {:number => number}
	guess = params['guess']
	message, background_color = check_message(guess.to_i)

	if @@tries == 0
		if message != "Correct!"
			message += "\n -- you ran out of guesses, number reset!"
		else
			message += "\n -- you guesses it, number reset!"
			reset_number()
		end
		@@tries = 5
	end
	@@tries -= 1

	if message == "Correct!"
		message += "\n -- you guesses it, number reset!"
		reset_number()
		@@tries = 5
	end


	erb :index, :locals => {:number => @@number, :message => message, :background_color => background_color, :guesses_left => @@tries + 1}
end

def check_message(guess)
	difference = (guess - @@number).abs
	if difference > 25
		if guess > @@number
			return "Too high!", "red"
		end
		if guess < @@number
			return "Too low!", "red"
		end
	elsif difference <= 25 && difference > 0
		if guess > @@number
			return "Too high", "darksalmon"
		else
			return "Too low", "darksalmon"
		end
	else
		return "Correct!", "green"
	end
end

def reset_number
	@@number = rand(100)
end


