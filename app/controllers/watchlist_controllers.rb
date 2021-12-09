class WatchlistController < ApplicationController
    
get "/watchlists" do
    watchlist = User.first.watchlists
    watchlist.to_json(include: [:movie, :user])
end

post '/watchlist' do
    movie = Movie.find(params[:id])
    Watchlist.create(user: User.first, movie: movie)
    {message: "#{movie.title} added to Watchlist!"}.to_json
end

delete '/watchlist/:id' do
    movie = Watchlist.find(params[:id])
    movie.destroy
    {message: "#{movie.movie.title} removed from Watchlist!"}.to_json
end

end

