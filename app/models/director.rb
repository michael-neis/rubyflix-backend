class Director < ActiveRecord::Base
    has_many :movies
    has_many :director_favorites
    has_many :users, through: :director_favorites

    def self.director_names
        self.all.map{|d| "#{d.first_name} #{d.last_name}"}
    end

end