#GETS PRACTICE
#Write a program that asks for somebody's first name and surname
#and returns a welcome message
#then asks for age in years
#and roughly calculates their age in seconds
#then prints another message
puts "What is your first name?"
first_name = gets.chomp
puts "What is your surname?"
surname = gets.chomp
puts "Hello #{first_name} #{surname}!  Nice to meet you!"

puts "How old are you?"
age = gets.chomp
age_secs = age.to_i*3600*24*365
puts "That means you are #{age_secs} seconds old!"

puts "What is your date of birth? (DD/MM/YYYY)"
dob = gets.chomp
puts "You were born on #{dob}"
list = dob.split('/')
dob_year = list[2]
time = Time.new
age_this_year = time.year - dob_year.to_i
puts "You turned #{age_this_year} this year!"

dob_month = list[1]
birthday = time.month - dob_month.to_i

if birthday > 0
	puts "You have already had your birthday"
elsif birthday == 0
	puts "Your birthday is this month"
else
	puts "You have not had your birthday yet"
end



#HASH PRACTICE:
#write a program asking for personal info (name, dob, age, height, etc.)
#store it in a hash
#ask for a list of relatives names and store them in an array within the hash
#use the each method to print out the keys and values
#have a play around with pry and hashes etc.

require 'date'
#get name and split it
puts "What's your full name?"
name = gets.chomp.split' '
first_name = name[0]
surname = name[-1]
#get date
puts "What is your date of birth? (DD/MM/YYYY)"
dob = gets.chomp
#split date and use to calculate age
dob_spl = dob.split'/'
dob_y = dob_spl[2].to_i
age = Date.today.year - dob_y
#relations array
puts "Name your 3 favourite relatives, separated by commas:"
relatives = gets.chomp.split', '
#create hash info with all given data
info = {
	firstname: first_name,
	surname: surname,
	dob: dob,
	age: age,
	relations: relatives
}
puts info
#display the contents of my hash
puts "My hash consists of these key value pairs:"
info.each do |k,v|
	puts "Key: #{k} and value: #{v}"
end