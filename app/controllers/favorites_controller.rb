class FavoritesController < ApplicationController
    
get '/favorite_movies' do 
    User.first.movie_favorites.to_json(include: :movie)
end

get '/favorite_directors' do
    User.first.director_favorites.to_json(include: :director)
end

end