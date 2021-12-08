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

        if self.reviews.length == 0
            "Please review some movies so we can give you a suggestion!"
        else
            
            #putting each attribute of the highest reviewed movies into it's appropriate array
            all_directors = []
            all_genres = []
            all_mpa_ratings = []
            reviewed_movies = self.reviews.map{|review| review.movie}
        
            highest_rating = reviews.max_by{|review| review.star_rating}.star_rating
            best_movies = reviews.filter{|review| review.star_rating == highest_rating}.each do |review|
                all_directors << review.movie.director
                all_genres << review.movie.genre
                all_mpa_ratings << review.movie.mpa_rating
            end

            #finding the highest amount of the most recurring attributes of highest reviewed movies. 
            top_director_tally = all_directors.tally.max_by{|director, count| count}[1]
            top_genre_tally = all_genres.tally.max_by{|genre, count| count}[1]
            top_mpa_rating_tally = all_mpa_ratings.tally.max_by{|mpa_rating, count| count}[1]

            #finding all attributes that have that highest amount
            top_directors = all_directors.tally.filter{|director, count| count == top_director_tally}.map{|director| director[0]}
            top_genres = all_genres.tally.filter{|genre, count| count == top_genre_tally}.map{|genre| genre[0]}
            top_mpa_ratings = all_mpa_ratings.tally.filter{|rating, count| count == top_mpa_rating_tally}.map{|rating| rating[0]}

            find_suggestion({top_directors: top_directors, top_genres: top_genres, top_mpa_ratings: top_mpa_ratings, reviewed_movies: reviewed_movies})
        end
    end
 
    private

    def find_suggestion(top_directors:, top_genres:, top_mpa_ratings:, reviewed_movies:)
        director_movies = []
        genre_matches = []
        mpa_rating_matches = []

        top_directors.each{|director| director.movies.each{|movie| director_movies << movie}}
        top_genres.each{|genre| director_movies.filter{|movie| movie.genre == genre}.each{|movie| genre_matches << movie}}
        top_mpa_ratings.each{|rating| genre_matches.filter{|movie| movie.mpa_rating == rating}.each{|movie| mpa_rating_matches << movie}}

        all_three_met = mpa_rating_matches.filter{|movie| reviewed_movies.exclude?(movie)}
        dir_gen_met = genre_matches.filter{|movie| reviewed_movies.exclude?(movie)}

        if all_three_met.length > 0
            all_three_met.sample
        elsif dir_gen_met.length > 0
            dir_gen_met.sample
        else 
            general_matches = director_movies
            top_genres.each{|genre| Movie.where(genre: genre).each{|movie| general_matches << movie}}
            no_duplicates = general_matches.filter{|movie| reviewed_movies.exclude?(movie)}
            no_duplicates.length > 0 ? no_duplicates.sample : "We couldn't find you a match. Try adding more reviews so we can narrow down a suggestion!"
        end
    end
end