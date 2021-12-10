class MoviesController < ApplicationController
    get "/movies" do
        movies = Movie.all
        movies.to_json(include: :director)
    end

    get "/movies/:id" do
        movie = Movie.find(params[:id])
        user = User.first
        movie.to_json(include: [:director, :watchlist_users, :review_users, :watchlists])
        # {movie: movie.to_json(include: [:director, :watchlist_users, :review_users]), user: user.to_json}
    end
end