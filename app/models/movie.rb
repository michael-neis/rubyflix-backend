class Movie < ActiveRecord::Base
    has_many :watchlists
    has_many :suggesteds
    has_many :reviews
    has_many :movie_favorites
    has_many :watchlist_users, through: :watchlists, source: :user
    # has_many :users, through: :suggesteds
    has_many :review_users, through: :reviews, source: :user
    # has_many :users, through: :movie_favorites
    belongs_to :director

    def self.all_titles
        self.all.map{|m| m.title}
    end
end