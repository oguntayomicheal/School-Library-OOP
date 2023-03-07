require './nameable'
require './person'

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.size > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end

# person = Person.new('maximilianus', 22)
# person.correct_name

# base = BaseDecorator.new(person)
# p base.correct_name

# capitalized_Person = CapitalizeDecorator.new(person)
# p capitalized_Person.correct_name

# capitalized_Trimmed_Person = TrimmerDecorator.new(capitalizedPerson)
# p capitalized_Trimmed_Person.correct_name
