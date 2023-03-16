require_relative '../teacher'

describe Teacher do
    before :each do
        @new_teacher = Teacher.new(15, 'Selma', 'Mathematics')
    end

    context 'While testing the Teacher class' do
        it 'Student should inherit from Person class' do
            expect(@new_teacher).to be_kind_of(Person)
        end

        it 'Check teacher Specialization' do
            expect(@new_teacher.specialization).to eq 'Mathematics'
        end

        it 'test can_use_services method' do
            expect(@new_teacher.can_use_services).to be_truthy
        end
    end
end