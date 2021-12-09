class WatchlistController < ApplicationController
    
post '/watchlist' do
    movie = Movie.find(params[:id])
    Watchlist.create(user: User.first, movie: movie)
    {message: "#{movie.title} added to Watchlist!"}.to_json
end

end

