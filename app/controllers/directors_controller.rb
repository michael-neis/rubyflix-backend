class DirectorsController < ApplicationController
    get "/directors" do
        directors = Director.all
        directors.to_json(include: :movies)
    end
end