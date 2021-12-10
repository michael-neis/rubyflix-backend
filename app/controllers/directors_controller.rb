class DirectorsController < ApplicationController
    get "/directors/:id" do
        director = Director.find(params[:id])
        director.to_json(include: :movies)
    end
end