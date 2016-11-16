class Person
	attr_accessor :hair_color, :top_color, :height

	def initialize(hair_color, top_color=nil, height=0.0)
		@hair_color = hair_color
		@top_color = top_color
		@height = height
	end

	#Other instance methods
	def dance
		"I'm Dancing!"
	end

	def sleep
		"zzzzzzzzzz"
	end
end