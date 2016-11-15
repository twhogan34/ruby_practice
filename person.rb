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

def div_numbers(a,b)
	a.to_f / b.to_f
end

def ind_numbers(a,b)
	a**b
end

=begin
def fact_num(a)
	result = a
	while a > 1 do
		result = result * (a - 1)
		a -= 1
	end
	result
end
=end

def fact_num(a)
	result = 1
	a.times.each do |i|
		result = result * (i+1)
	end
	result
end








