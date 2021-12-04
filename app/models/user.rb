class User < ActiveRecord::Base
    has_many :watchlists
    has_many :suggesteds
    has_many :reviews
    has_many :friendslists
    has_many :favorites
    has_many :movies, through: :watchlists
    has_many :movies, through: :suggesteds
    has_many :movies, through: :reviews
    has_many :movies, through: :favorites
    has_many :directors, through: :favorites
    has_many :users, through: :friendslists
    has_many :users, through: :suggesteds
end