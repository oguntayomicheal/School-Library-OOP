require 'json'
require './book'
require './rental'
require './student'
require './teacher'

module BookData
  # rubocop:disable Style/MutableConstant
  FILE_NAME_BOOK = './database/book.json'
  # rubocop:enable Style/MutableConstant

  def preserve_book(data)
    book_arr = []
    data.each do |d|
      book_arr << {
        title: d.title,
        author: d.author
      }
    end
    File.write(FILE_NAME_BOOK, JSON.generate(book_arr))
  end

  def create_book_class(arr)
    new_arr = []
    arr.each do |el|
      new_arr << Book.new(el['title'], el['author'])
    end
    new_arr
  end

  def read_book
    File.new(FILE_NAME_BOOK.to_s, 'w') unless File.exist?(FILE_NAME_BOOK)
    file = File.read(FILE_NAME_BOOK)
    data = file.empty? ? [] : JSON.parse(file)
    create_book_class(data)
  end
end
