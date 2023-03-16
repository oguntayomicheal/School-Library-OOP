require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom, parent_permission: true)
    @classroom = classroom
    @parent_permission = parent_permission
    super(age, name)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
