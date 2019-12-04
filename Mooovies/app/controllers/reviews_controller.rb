class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def show
        @review =  Review.find(params[:id])
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.create(params.require(:review).permit(:rating, :content), movie: @movie, user: @user )
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :user_id, :movie_id)
    end

end
