require 'date'
require 'pry'
# Person class defined
class Person
  attr_reader :first_name, :surname, :dob, :emails, :phone_numbers

  def initialize(first_name, surname, dob = nil)
    @first_name = first_name.capitalize
    @surname = surname.capitalize
    @dob = Date.parse(dob) unless dob.nil?
    @emails = []
    @phone_numbers = []
  end

  def first_name=(first_name)
    @first_name = first_name.capitalize
  end

  def surname=(surname)
    @surname = surname.capitalize
  end

  def dob=(dob)
    @dob = Date.parse(dob)
  end

  def add_email(email)
    @emails << email
  end

  def add_phone(phone)
    @phone_numbers << phone
  end

  def remove_email(index)
    @emails.delete_at(index)
  end

  def remove_phone(index)
    @phone_numbers.delete_at(index)
  end

  def to_s
    "#{@first_name} #{@surname} was born on #{@dob}.\n Their email addresses are:\n#{@emails}.\n Their phone numbers are #{@phone_numbers}"
  end

  def fullname
    "#{first_name} #{surname}"
  end

  def print_details
    puts fullname
    puts '-' * fullname.length
    puts "Date of Birth: #{@dob.strftime('%d %B %Y') rescue 'Unknown'}"
    puts ''
    puts 'Email Addresses:'
    @emails.each do |email|
      puts '- ' + email
    end
    puts ''
    puts 'Phone Numbers:'
    @phone_numbers.each do |phone|
      puts '- ' + phone
    end
  end
end

joe = Person.new('joe', 'bloggs', '1 Jan 1990')
joe.add_email('joe@foo.com')
joe.add_email('joe.bloggs@work.com')
joe.add_phone('02012345678')
joe.print_details
