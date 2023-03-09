require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @action_list = {
      "1": 'List all books',
      "2": 'List all people',
      "3": 'Create a person',
      "4": 'Create a book',
      "5": 'Create a rental',
      "6": 'List all rentals for a given person id',
      "7": 'Exit'
    }
    @books = []
    @people = []
  end

  def display_list
    colorize_output(33, 'Please choose an option by entering a number:')
    @action_list.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  def colorize_output(color_code, statements)
    puts "\e[#{color_code}m#{statements}\e[0m"
  end

  def colorize_outprint(color_code, statements)
    print "\e[#{color_code}m#{statements}\e[0m"
  end

  def list_all_books
    if @books.empty?
      colorize_output(31, "Please insert books first!!")
    else
      @books.each_with_index do |book, index|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
    run()
  end

  def list_all_people
    if @people.empty?
      colorize_output(31, "Please insert people first!!")
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    run()
  end

  def create_person
    colorize_outprint(35, 'Do you want to create a student (1) or a teacher (2)? [Input the nummber]: ')

    case gets.chomp
    when "1"
    colorize_output(36, 'Enter Student details')
      colorize_outprint(35, 'Name: ')
      name = gets.chomp

      colorize_outprint(35, 'Age: ')
      age = gets.chomp

      colorize_outprint(35, 'Has parent permission? [Y/N]: ')
      permission = gets.chomp.downcase
      case permission
      when "y" then parent_permission = true
      when "n" then parent_permission = false
      end

      @people.push(Student.new(age, name, parent_permission))
      colorize_output(36, 'Person Student Created successfully')
    when "2"
        colorize_output(36, 'Enter Teacher details')
      colorize_outprint(35, 'Name: ')
      name = gets.chomp

      colorize_outprint(35, 'Age: ')
      age = gets.chomp

      colorize_outprint(35, 'Specialization: ')
      specialization = gets.chomp
      @people.push(Teacher.new(age, name, specialization))
      colorize_output(36, 'Person Teacher Created successfully')
    end
    run()
  end

   def create_book
    colorize_output(36, 'Enter Book details')
    colorize_outprint(35, 'Title: ')
    title = gets.chomp

    colorize_outprint(35, 'Author: ')
    author = gets.chomp

    @books.push(Book.new(title, author))

    colorize_output(36, 'Book Created successfully')
    run()
  end

  def list_all_books_with_numbers
    if @books.empty?
      colorize_output(31, 'Please insert books first!!')
      run
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_person_with_numbers
    if @people.empty?
        colorize_output(31, 'Please insert people first!!')
        run
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental()
    colorize_output(36, 'Select a book from the following list by number')
    list_all_books_with_numbers()
    book_option = gets.chomp.to_i

    colorize_output(36, 'Select a person from the following list by number (not id)')
    list_all_person_with_numbers()
    person_option = gets.chomp.to_i
   

    colorize_outprint(36, 'Date: ')
    date = gets.chomp
    Rental.new(date, @books[book_option], @people[person_option])

    colorize_output(36, 'Rental created successfully')
    run()
  end

  def execute_user_option(user_option)
    case user_option
    when "1" then list_all_books()
    when "2" then list_all_people()
    when "3" then create_person()
    when "4" then create_book()
    when "5" then create_rental()
    end
  end

  # Run the program
  def run
    display_list()
    user_option = gets.chomp
    execute_user_option(user_option)
    puts
  end
end
