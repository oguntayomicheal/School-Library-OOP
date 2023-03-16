require_relative '../person'
require_relative '../decorator'

describe BaseDecorator do
  before :each do
    @new_person = Person.new(22, 'maximilianus')
    @base_decorator = BaseDecorator.new(@new_person)
  end

  context 'While testing the BaseDecorator class' do
    it 'check if the correct_name method returns the name' do
      expect(@base_decorator.correct_name).to eql 'maximilianus'
    end
  end
end
