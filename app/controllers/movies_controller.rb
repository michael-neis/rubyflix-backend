class MoviesController < ApplicationController
    get "/movies" do
        movies = Movie.all
        movies.to_json(include: :director)
    end

    get "/movies/:id" do
        movie = Movie.find(params[:id])
        user = User.first
        movie.to_json(include: [:director, :watchlist_users, :review_users, :watchlists])
    end

    get "/genres/:genre" do
        User.first.find_genre(params[:genre]).to_json
    end

    get "/movie_titles" do
        Movie.all_titles.to_json
    end

    get "/search_movie/:title" do 
        Movie.all.find{|m| m.title == params[:title]}.id.to_json
    end

end