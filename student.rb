require './person'
class Student < Person
  def initialize(classroom, name = "unknown", age, parent_permission: true)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
