require_relative '../book'
require_relative '../rental'

describe Book do
  before :each do
    @new_book = Book.new('Book1', 'Selma')
  end

  it 'Inserted data should match attributes' do
    title = @new_book.title
    author = @new_book.author

    expect(title).to eql 'Book1'
    expect(author).to eql 'Selma'
  end
end
