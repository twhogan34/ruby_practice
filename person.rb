def add_numbers(a,b)
	a+b
end

def sub_numbers(a,b)
	a-b
end

def add_array_numbers(a)
	result = 0
	a.each {|num| result += num}
	return result
end