class MoviesController < ApplicationController
    def index
        
    end

    def show
       @movie = movie_api_call(params[:id])
    end

  
    private

    def movie_api_call(movie_id)
        response =  RestClient.get("http://www.omdbapi.com/?i=#{movie_id}&type=movie&apikey=3f96a270")
        movie_hash = JSON.parse(response.body)
    end
end
