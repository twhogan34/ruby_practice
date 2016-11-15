def add_numbers(a,b)
	a+b
end

def sub_numbers(a,b)
	a-b
end

def add_array_numbers(a)
	result = 0
	a.each {|num| result += num}
	result
end
=begin
def add_array_numbers(a)
	result = 0
	a.each_with_index do |var, ind|
		result += var
		ind +=1
	end
	result
end
=end

def mult_numbers(a,b)
	a*b
end

def mult_array(a)
	result = 1
	a.each {|num| result *= num}
	result
end