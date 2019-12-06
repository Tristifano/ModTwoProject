class ReviewsController < ApplicationController

    def create
        @new_movie = Movie.new

        @movie = Movie.all.select { |m|
             m.properties["imdbID"] == params[:movie][:id]
            }
                    
        if @movie.length == 0
            hash_movie = movie_api_call('i', params[:movie][:id])
            @new_movie.properties = hash_movie
            @new_movie.save
        else
            @new_movie = @movie[0]
        end

        @user = User.find(session[:user_id])

        review = Review.create(
            content: params[:content],
            rating: params[:rating],
            movie: @new_movie,
            user: @user)
        
        if review.save
            redirect_to "/movies/#{@new_movie.properties["imdbID"]}"
        end
    end

    private

    def movie_api_call(q, keyword)
        response =  RestClient.get("http://www.omdbapi.com/?#{q}=#{keyword}&type=movie&apikey=3f96a270")
        results_hash = JSON.parse(response.body)
    end

end
