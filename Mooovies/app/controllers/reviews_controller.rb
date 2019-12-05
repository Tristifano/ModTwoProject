class ReviewsController < ApplicationController

    def create
        @movie = movie_api_call('i', params[:movie][:id])
        @new_movie = Movie.new
        @new_movie.properties = @movie
        @new_movie.save
        
        @user = User.find(session[:user_id])

        Review.create(
            content: params[:content],
            rating: params[:rating],
            movie: @new_movie,
            user: @user
        )
    end

    private

    def movie_api_call(q, keyword)
        response =  RestClient.get("http://www.omdbapi.com/?#{q}=#{keyword}&type=movie&apikey=3f96a270")
        results_hash = JSON.parse(response.body)
    end

end
