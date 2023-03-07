require './nameable'

class BaseDecorator < Nameable
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.correct_name
    end


end

class CapitalizeDecorator < BaseDecorator
    def correct_name
        @nameable.correct_name.capitalize()
    end
end

class TrimmerDecorator < BaseDecorator
    def correct_name
        @nameable.correct_name.size() > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name 
    end
end