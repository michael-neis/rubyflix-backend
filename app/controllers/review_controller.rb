class ReviewController < ApplicationController
    
    post '/reviews' do
        movie = Movie.find(params[:id])
        Review.create(user: User.first, movie: movie, star_rating: params[:star_rating], comment: params[:comment])
        User.first.to_json(include: [:watchlists, :reviews, :movie_favorites, :director_favorites])
    end
    
    patch '/reviews/:id' do
        review = Review.find(params[:id])
        review.update(
            star_rating: params[:star_rating],
            comment: params[:comment]
        )
        User.first.to_json(include: [:watchlists, :reviews, :movie_favorites, :director_favorites])
    end
    
    end