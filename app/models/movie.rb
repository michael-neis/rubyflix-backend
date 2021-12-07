class Movie < ActiveRecord::Base
    has_many :watchlists
    has_many :suggesteds
    has_many :reviews
    has_many :movie_favorites
    has_many :users, through: :watchlists
    has_many :users, through: :suggesteds
    has_many :users, through: :reviews
    has_many :users, through: :movie_favorites
    belongs_to :director
end