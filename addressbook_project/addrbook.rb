require './person_dets.rb'
require 'pry'
# AddressBook class defined
class AddressBook
  attr_reader :store

  def initialize
    @store = []
  end

  def add(person)
    person = {
      fullname: person.fullname,
      dob: person.dob.to_s
    }
    @store << person
  end

  def list
    name = []
    @store.each do |hash|
      name.push hash[:fullname]
    end
    puts 'Address Book'
    puts '-' * 'Address Book'.length
    @store.each_with_index do |_value, index|
      puts "Entry #{index + 1}: #{name[index]}"
    end
  end
end
