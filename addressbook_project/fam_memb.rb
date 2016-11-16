# FamilyMember class defined
class FamilyMember < Person
  attr_reader :relationship

  def initialize(first_name, surname)
    super
    @relationship = nil
  end

  def new_rel(rel)
    @relationship = rel
  end
end
