class App
    def initialize
        # Print commands
        @cmd = {
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
        @cmd.each do |index, command|
          puts "#{index} - #{command}"
        end
      end

      def colorize_output(color_code, statements)
       puts "\e[#{color_code}m#{statements}\e[0m"
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

      def execute_user_option(user_option)
        case user_option
        when "1" then list_all_books()
        when "2" then list_all_people()
        end
      end

       # Run the program
  def run
    colorize_output(32, 'Welcome to School Library App!')
    display_list() 
    user_option = gets.chomp
    execute_user_option(user_option)
    puts
  end


end