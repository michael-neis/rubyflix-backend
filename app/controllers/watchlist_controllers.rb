class WatchlistController < ApplicationController
    
get "/watchlist" do
    User.first.find_watchlist.to_json
end

post '/watchlist' do
    movie = Movie.find(params[:id])
    item = Watchlist.create(user: User.first, movie: movie)
    {message: "#{movie.title} added to Watchlist!", watchlist: item}.to_json
end

delete '/watchlist/:id' do
    movie = Watchlist.find(params[:id])
    movie.destroy
    {message: "#{movie.movie.title} removed from Watchlist!", watchlist: movie}.to_json
end

end

