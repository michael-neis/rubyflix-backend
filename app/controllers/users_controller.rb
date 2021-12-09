class UsersController < ApplicationController
    get "/users" do
        user = User.first
        user.to_json(include: [:watchlists, :reviews, :movie_favorites, :director_favorites])
    end

    get "/user/watchlist" do
        movies = User.first.watchlists.map{|w| w.movie}
        movies.to_json(include: :director)
    end

    get "/user/reviews" do
        movies = User.first.reviews.map{|r| r.movie}
        movies.to_json(include: :director)
    end

    get "/user/favorites" do
        directors = User.first.director_favorites.map{|f| f.director}
        movies = User.first.movie_favorites.map{|f| f.movie}
        favorites_hash = {directors: directors, movies: movies}
        favorites_hash.to_json
    end

    get "/user/find_new_movie" do
        movie = User.first.suggest_movie
        movie.to_json(include: :director)
    end

end