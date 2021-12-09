class ReviewController < ApplicationController
    
    post '/reviews' do
        movie = Movie.find(params[:id])
        Review.create(user: User.first, movie: movie, star_rating: params[:star_rating], comment: params[:comment])
        {message: "Review added to #{movie.title}!"}.to_json
    end
    
    patch '/reviews/:id' do
        review = Review.find(params[:id])
        review.update(
            star_rating: params[:star_rating],
            comment: params[:comment]
        )
        review.to_json
    end
    
    end