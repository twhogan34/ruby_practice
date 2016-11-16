require 'date'
class Person
	attr_reader :first_name, :surname, :dob, :fullname, :emails, :phone_numbers

	def initialize(first_name, surname, dob=nil)
		@first_name = first_name.capitalize!
		@surname = surname.capitalize!
		@dob = Date.parse(dob) rescue nil
		@fullname = "#{first_name} #{surname}"
		@emails = []
		@phone_numbers = []
	end

	def change_first_name(first_name)
		@first_name = first_name.capitalize!
		@fullname = "#{@first_name} #{@surname}"
	end

	def change_surname(surname)
		@surname = surname.capitalize!
		@fullname = "#{@first_name} #{@surname}"
	end

	def set_dob(dob)
		@dob = Date.parse(dob).to_s
	end

	def add_email(email)
		@emails << email
	end

	def add_phone(phone)
		@phone_numbers << phone
	end

	def remove_email(email)
		@emails.delete_at(email)
	end

	def remove_phone(phone)
		@phone_numbers.delete_at(phone)
	end

	def to_s
		"#{@fullname} was born on #{@dob}.\n Their email addresses are:\n#{@emails}.\n Their phone numbers are #{@phone_numbers}"
	end

end