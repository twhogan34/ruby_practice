require './person_dets.rb'
require 'pry'
require 'yaml'
# AddressBook class defined
class AddressBook
  attr_reader :store

  def initialize
    @store = []
  end

  def add(person)
    if person.class == Person || person.class == FamilyMember
      @store << person
    else
      raise 'You can only enter people into this addressbook'
    end
  end

  def list
    puts 'Address Book'
    puts '------------'
    @store.each_with_index do |value, index|
      puts "Entry #{index + 1}: #{value.first_name} #{value.surname}"
    end
  end

  def load_yaml(path="./addrbook_data.yml")
    file = YAML.load(File.open(path))
    file['people'].each do |yaml_person|
      new_person = Person.new(yaml_person['first_name'], yaml_person['surname'], yaml_person['dob'])
      yaml_person['emails'].each { |email| new_person.add_email(email) }
      yaml_person['phone_numbers'].each { |phone| new_person.add_phone(phone) }
      add(new_person)
    end
  end
end
