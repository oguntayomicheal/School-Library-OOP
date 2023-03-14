require 'json'
require './book'

module BookData
  FILE_NAME = "./database/book.json"

  def preserve_book(data)
    bookArr = []
    data.each do |d|
      bookArr << {
        title: d.title,
        author: d.author
      }
    end
    File.write(FILE_NAME, JSON.generate(bookArr))
  end

  def create_book_class(arr)
    new_arr = []
    arr.each do |el|
      new_arr << Book.new(el["title"], el["author"])
    end
    return new_arr
  end

  def read_book
    File.new("#{FILE_NAME}", "w") unless File.exist?(FILE_NAME)
    file = File.read(FILE_NAME)
    data = (file.empty?) ? [] : JSON.parse(file)
    return create_book_class(data)
  end
end
