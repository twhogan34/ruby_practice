require 'date'
class Bird

	def initialize
		@color = nil
		@type = nil
		@spotted = false
		@can_fly = false
		@length = 0.0
	end

	def get_color
		return @color
	end

	def get_type
		return @type
	end

	def get_spotted?
		return @spotted
	end

	def get_can_fly?
		return @can_fly
	end

	def get_length
		return @length
	end

	def set_color(color)
		@color = color
	end

	def set_type(type)
		@type = type
	end

	def set_spotted?(spotted)
		if spotted == true
			@spotted = Date.today
		else
			@spotted = 'Unspotted'
		end
		return @spotted
	end

	def set_can_fly?(fly)
		if fly == true
			@can_fly ='I can fly'
		else
			@can_fly = 'Sadly I am grounded :('
		end
		return @can_fly
	end

	def set_length(length)
		@length = length
	end

	def chirp
		return 'Pretty Polly'
	end

	def fly
		@can_fly = true
		return 'Let\'s fly away!'
	end	

	def waddle
		@can_fly = false
		return 'Sadly I can\'t fly, I have to waddle!'
	end

	def peck
		return 'Hey! That\'s my food! Keep off!'
	end

	def description
		return "I am a #{@type}, I was first spotted on #{@spotted}, I am #{@color}, I'm #{@length}cm long, #{@can_fly} and I love to say '#{chirp}'"
	end

end

