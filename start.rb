require_relative 'app'
class Start
  def initialize
    @app = App.new
  end

  def app_start
    puts @app.colorize_output(32, 'Welcome to the School Library App!')
    loop do
      display_list
      continue
    end
  end

  def display_list
    action_list = {
      '1': 'List all books',
      '2': 'List all people',
      '3': 'Create a person',
      '4': 'Create a book',
      '5': 'Create a rental',
      '6': 'List all rentals for a given person id',
      '7': 'Exit'
    }
    puts "\e[33mPlease choose an option by entering a number:\e[0m"
    action_list.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  def continue
    user_option = gets.chomp

    case user_option
    when '1' then @app.list_all_books
    when '2' then @app.list_all_people
    when '3' then @app.create_person
    when '4' then @app.create_book
    when '5' then @app.create_rental
    when '6' then @app.list_rentals_of_person_id
    when '7'
      @app.colorize_output(32, 'Thank you for using this app!')
      exit
    end
  end
end
