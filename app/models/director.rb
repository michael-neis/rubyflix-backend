class Director < ActiveRecord::Base
    has_many :movies
    has_many :favorites
    has_many :users, through: :favorites
end