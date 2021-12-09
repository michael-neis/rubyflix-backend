class MoviesController < ApplicationController
    get "/movies" do
        movies = Movie.all
        movies.to_json(include: :director)
    end
end