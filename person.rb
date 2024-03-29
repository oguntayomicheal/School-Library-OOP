require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimmer'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission, :specialization

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name

capitalized = CapitalizeDecorator.new(person)
capitalized.correct_name

trim = TrimmerDecorator.new(capitalized)
trim.correct_name
