require './person_dets.rb'
# FamilyMember class defined
class FamilyMember < Person
  attr_accessor :relationship

  def initialize(first_name, surname, dob = nil, relationship = 'relative')
    super(first_name, surname, dob)
    @relationship = relationship
  end
end
