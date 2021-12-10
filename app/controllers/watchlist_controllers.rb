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
    list_movie = Watchlist.find(params[:id])
    list_movie.destroy
    {message: "#{list_movie.movie.title} removed from Watchlist!", watchlist: list_movie}.to_json
end

post '/watchlist/details' do
    movie = Movie.find(params[:id])
    item = Watchlist.create(user: User.first, movie: movie)
    movie.to_json(include: [:director, :watchlist_users, :review_users, :watchlists])
end

delete '/watchlist/details/:id' do
    list_movie = Watchlist.find(params[:id])
    movie = list_movie.movie
    list_movie.destroy
    movie.to_json(include: [:director, :watchlist_users, :review_users, :watchlists])
end

end

