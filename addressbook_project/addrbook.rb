require './person_dets.rb'
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

end
