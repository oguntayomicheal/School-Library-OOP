require_relative '../person'

describe Person do
  before :each do
    @new_person = Person.new(40, 'Selma')
  end

  context 'When testing the person class' do
    it 'Inserted data should match attributes' do
      age = @new_person.age
      name = @new_person.name

      expect(age).to eql 40
      expect(name).to eql 'Selma'
    end

    it 'Return correct name' do
      expect(@new_person.correct_name).to eq 'Selma'
    end

    it 'Check if person can use service' do
      expect(@new_person.can_use_services?).to eq true
    end
  end
end
