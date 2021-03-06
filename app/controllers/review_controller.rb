class ReviewController < ApplicationController

    get '/reviews' do
        User.first.find_reviews.to_json
    end
    
    post '/reviews' do
        movie = Movie.find(params[:id])
        Review.create(user: User.first, movie: movie, star_rating: params[:star_rating], comment: params[:comment])
        User.first.find_reviews.to_json
    end
    
    patch '/reviews/:id' do
        review = Review.find(params[:id])
        review.update(
            star_rating: params[:star_rating],
            comment: params[:comment]
        )
        User.first.find_reviews.to_json
    end
    
    end