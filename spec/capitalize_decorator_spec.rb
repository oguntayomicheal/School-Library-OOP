require_relative '../person'
require_relative '../capitalize'

describe CapitalizeDecorator do
  before :each do
    @new_person = Person.new(22, 'maximilianus')
    @capitalize_decorator = CapitalizeDecorator.new(@new_person)
  end

  context 'While testing the Capitalize decorator class' do
    it 'check if the name is capitalize' do
      expect(@capitalize_decorator.correct_name).to eql 'Maximilianus'
    end
  end
end
