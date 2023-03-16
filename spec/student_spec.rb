require_relative '../student'
require_relative '../classroom'

describe Student do
    before :each do
        @new_classroom = Classroom.new('Secondary')
        @new_student = Student.new(15, 'Selma', @new_classroom)
    end

    context 'While testing the Student class' do
        it 'Student should inherit from Person class' do
            expect(@new_student).to be_kind_of(Person)
        end

        it 'Check classroom attribute in Student' do
            expect(@new_student.classroom.label).to eq 'Secondary'
        end

        it 'test the play_hocky method' do
            expect(@new_student.play_hooky).to eql '¯\(ツ)/¯'
        end

        it 'classrooms setter should populate @students array' do
            @new_student.classroom=@new_classroom
            expect(@new_classroom.students.length).to eql(1)
          end

    end
end