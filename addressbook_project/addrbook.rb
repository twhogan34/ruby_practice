# Person class defined
require 'date'
require 'pry'
class Person
  attr_reader :first_name, :surname, :dob, :fullname, :emails, :phone_numbers

  def initialize(first_name, surname, dob = nil)
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

  def print_details
    puts @fullname
    puts '-' * @fullname.length
    puts "Date of Birth: #{@dob.strftime('%d %B %Y') rescue 'Unknown'}"
    puts ''
    puts 'Email Addresses:'
    @emails.each do |email|
      puts '- ' + email + '\n'
    end
    puts ''
    puts 'Phone Numbers:'
    @phone_numbers.each do |phone|
      puts '- ' + phone + '\n'
    end
  end
end

joe = Person.new('joe', 'bloggs', '1 Jan 1990')
joe.add_email('joe@foo.com')
joe.add_email('joe.bloggs@work.com')
joe.add_phone('02012345678')
joe.print_details
