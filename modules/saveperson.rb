require 'json'
require './student'
require './teacher'

module PersonData
    FILE_NAME = "./database/person.json"

    def preserve_people(data)
        new_data = []
        data.each do |d|
          new_data << {
            type: d.class,
            data: {
              name: d.name,
              age: d.age,
               parent_permission: d.parent_permission,
              specialization: d.specialization,
            }
          }
        end
        File.write(FILE_NAME, JSON.generate(new_data))
      end

      def create_person_class(data)
        arr = []

        data.each do |d|
          if d["type"] == "Teacher"
            arr << Teacher.new(d["data"]["age"], d["data"]["name"], d["data"]["specialization"])
          elsif d["type"] == "Student"
            arr << Student.new(d["data"]["age"], d["data"]["name"], d["data"]["parent_permission"])
          end
        end

        arr
      end

      def read_person
        File.new("#{FILE_NAME}", "w") unless File.exist?(FILE_NAME)
        file = File.read(FILE_NAME)
        data = (file.empty?) ? [] : JSON.parse(file)
        return create_person_class(data)
      end

end