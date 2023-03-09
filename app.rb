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
        puts 'Please choose an option by entering a number:'
        @cmd.each do |index, command|
          puts "#{index} - #{command}"
        end
      end

      def colorize(color_code, statements)
       puts "\e[#{color_code}m#{statements}\e[0m"
      end

       # Run the program
  def run
    colorize(32, 'Welcome to School Library App!')
    display_list()

    
  end


end