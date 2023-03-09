require_relative 'app'

def main
  puts "\e[32m'Welcome to the School Library App!'\e[0m"
  new_app = App.new
  new_app.run()
end

main()
