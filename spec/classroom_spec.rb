require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @new_classroom = Classroom.new('Secondary')
    @new_student = Student.new(15, 'Selma', @new_classroom)
  end

  context 'While testing the Classroom class' do
    it 'Check label attribute in Student' do
      expect(@new_classroom.label).to eq 'Secondary'
    end

    it 'test the add_student method' do
      @new_classroom.add_student(@new_student)
      expect(@new_classroom.students.length).to eq(1)
    end
  end
end
