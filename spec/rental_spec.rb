require_relative '../rental'
require_relative '../book'
require_relative '../student'

describe Rental do
  before :each do
    @new_book = Book.new('Book1', 'Senior')
    @new_student = Student.new('5', 67, 'Reasons')
    @new_rental = Rental.new('2020/09/09', @new_book, @new_student)
  end
  context 'While testing the Rental class' do
    it 'Rental should return an object with book and person objects' do
      expect(@new_rental.book).to be_kind_of(Book)
      expect(@new_rental.person).to be_kind_of(Student)
    end

    it 'should validate the attributes of the rental' do
        expect(@new_rental.date).to eq '2020/09/09'
        expect(@new_rental.person).to eq @new_student
        expect(@new_rental.book).to eq @new_book
      end
  end
end
