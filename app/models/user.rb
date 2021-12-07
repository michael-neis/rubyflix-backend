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

        top_director_tally = all_directors.tally.max_by{|director, count| count}[1]
        top_genre = all_genres.tally.max_by{|genre, count| count}
        top_mpa_rating = all_mpa_ratings.tally.max_by{|mpa_rating, count| count}

        top_directors = all_directors.tally.filter{|director, count| count == top_director_tally}.map{|director| director[0]}

        if top_mpa_rating[1] > 1 && top_director_tally > 1
            best_suggestion = first_tier_suggestions(top_directors, top_genre, top_mpa_rating, reviewed_movies)
            if best_suggestion
                best_suggestion
            else
                second_best_suggestion = second_tier_suggestions(top_directors, top_genre, reviewed_movies)
                second_best_suggestion ? second_best_suggestion : third_tier_suggestions(top_genre, reviewed_movies)
            end
        elsif top_director_tally > 1
            second_best_suggestion = second_tier_suggestions(top_directors, top_genre, reviewed_movies)
            second_best_suggestion ? second_best_suggestion : third_tier_suggestions(top_genre, reviewed_movies)
        elsif top_genre[1] > 1
            third_best_suggestion = third_tier_suggestions(top_genre, reviewed_movies)
            third_best_suggestion ? third_best_suggestion : "We couldn't find you a match. Try adding more reviews so we can narrow down a suggestion!"
        else
            "We couldn't find you a match. Try adding more reviews so we can narrow down a suggestion!"
        end

        end
    end 

    private

    def first_tier_suggestions(top_directors, top_genre, top_mpa_rating, reviewed_movies)
        first_options = []
        puts "bogos"
        top_directors.each{|director| Movie.where(director: director, genre: top_genre[0], mpa_rating: top_mpa_rating[0]).each{|movie| first_options << movie}}
        puts "binted"
        no_duplicates = first_options.filter{|movie| reviewed_movies.exclude?(movie)}

        no_duplicates.sample
    end

    def second_tier_suggestions(top_directors, top_genre, reviewed_movies)
        # director = top_directors.sample
        second_options = top_directors.map{|director| Movie.where(director: director, genre: top_genre[0]).filter{|movie| reviewed_movies.exclude?(movie)}}
        binding.pry
        second_options.sample
    end

    def third_tier_suggestions(top_genre, reviewed_movies)
        third_options = Movie.where(genre: top_genre[0]).filter{|movie| reviewed_movies.exclude?(movie)}
        third_options.sample
    end

end