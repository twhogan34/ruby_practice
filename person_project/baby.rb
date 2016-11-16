# Baby class defined, inherits from Person
class Baby < Person
  def initialize
    super 'none'
    @smells = true
  end

  def smells?
    @smells
  end

  def clean
    @smells = false
  end

  def dance
    'waaaaaaaaaa'
  end
end
