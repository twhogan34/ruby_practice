#FIZZBUZZ EXERCISE
#write a program that:
#prints numbers 1 to 200, each on their own line
#if number is divisible by 3, 'Fizz' instead of number
#if 5, 'Buzz'
#if 3 and 5, 'FizzBuzz'
#Try and be as elegant and clean as possible

num = Array(1..200)
num.each do |n|
	if n%15 == 0
		puts "FizzBuzz"
	elsif n%3 == 0
		puts "Fizz"
	elsif n%5 == 0
		puts "Buzz"
	else
		puts n
	end
end

#BONUS POINTS
#refactor to use the smallest number of characters possible
#remember newlines are characters

1.upto(200){|n|p n%15<1?"FizzBuzz":n%3<1?"Fizz":n%5<1?"Buzz":n}