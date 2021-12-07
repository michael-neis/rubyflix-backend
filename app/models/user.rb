require "pry"

class User < ActiveRecord::Base
    has_many :watchlists
    has_many :suggesteds
    has_many :reviews
    has_many :movie_favorites
    has_many :director_favorites
    has_many :movies, through: :watchlists
    has_many :movies, through: :suggesteds
    has_many :movies, through: :reviews
    has_many :movies, through: :movie_favorites
    has_many :directors, through: :director_favorites
    has_many :users, through: :suggesteds

    has_many :friendslists, :foreign_key => :user_a_id
    has_many(:reverse_friendslists, :class_name => :Friendslist,
        :foreign_key => :user_b_id, :dependent => :destroy)
    has_many :users, :through => :friendslists, :source => :user_b

    # has_and_belongs_to_many(:users,
    # :join_table => "friendslists",
    # :foreign_key => "user_a_id",
    # :association_foreign_key => "post_b_id")

    # has_many :friendslists, ->(user) {where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id)}
    # has_many :friends, through: :friendslists

    
    def suggest_movie
        all_directors = []
        all_genres = []
        all_mpa_ratings = []

        highest_rating = reviews.max_by{|review| review.star_rating}.star_rating
        best_movies = reviews.filter{|review| review.star_rating == highest_rating}.each do |review| 
            all_directors << review.movie.director
            all_genres << review.movie.genre
            all_mpa_ratings << review.movie.mpa_rating
        end

        top_director = all_directors.tally.max_by{|_, count| count}[0]
        top_genre = all_genres.tally.max_by{|_, count| count}[0]
        top_mpa_rating = all_mpa_ratings.tally.max_by{|_, count| count}[0]

        first_options = Movie.where(director: top_director, genre: top_genre, mpa_rating: top_mpa_rating)
        second_options = Movie.where(director: top_director, genre: top_genre)
        third_options = Movie.where(genre: top_genre)

        binding.pry
        # tally_score = all_attributes.tally.max_by{|_, count| count}[1]
        # most_common = all_attributes.tally.filter{|_, count| count == tally_score}.keys
        # first_options = Movie.where(director: most_common[0], genre: most_common[1], rating: most_common[2])
        # second_options = Movie.where(director: most_common[0], genre: most_common[1])
        # third_options = Movie.where(genre: most_common[1])
    end 
end