require_relative '../person'
require_relative '../capitalize'

describe TrimmerDecorator do
  before :each do
    @new_person = Person.new(22, 'maximilianus')
    @capitalize_decorator = CapitalizeDecorator.new(@new_person)
    @trimmer_decorator = TrimmerDecorator.new(@capitalize_decorator)
  end

  context 'While testing the Trimmer decorator class' do
    it 'check if the name is trimmed to 10 characters' do
      expect(@trimmer_decorator.correct_name).to eql 'Maximilian'
    end
  end
end
