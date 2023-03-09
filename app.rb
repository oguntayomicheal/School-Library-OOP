require_relative 'student'
require_relative 'teacher'

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
    colorize_output(35, 'Do you want to create a student (1) or a teacher (2)? [Input the nummber]:')

    case gets.chomp
    when "1"
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

  def execute_user_option(user_option)
    case user_option
    when "1" then list_all_books()
    when "2" then list_all_people()
    when "3" then create_person()
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
