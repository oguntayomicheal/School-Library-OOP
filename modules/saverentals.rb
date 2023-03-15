require 'json'

module RentalData
  # rubocop:disable Style/MutableConstant
  FILE_NAME_RENTALS = './database/rentals.json'
  # rubocop:enable Style/MutableConstant

  def preserve_rental(data)
    File.write(FILE_NAME_RENTALS, JSON.generate(data))
  end

  def read_rental
    File.new(FILE_NAME_RENTALS.to_s, 'w') unless File.exist?(FILE_NAME_RENTALS)
    file = File.read(FILE_NAME_RENTALS)
    file.empty? ? [] : JSON.parse(file)
  end
end
