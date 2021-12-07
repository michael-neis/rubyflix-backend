class Director < ActiveRecord::Base
    has_many :movies
    has_many :director_favorites
    has_many :users, through: :director_favorites
end