class MoviesController < ApplicationController
    def index
        @movies = search_api_call(params[:keyword])
    end

    def show
       @movie = movie_api_call(params[:id])
    end

    private

    def movie_api_call(movie_id)
        response =  RestClient.get("http://www.omdbapi.com/?i=#{movie_id}&type=movie&apikey=3f96a270")
        movie_hash = JSON.parse(response.body)
    end

    def search_api_call(keyword)
        response =  RestClient.get("http://www.omdbapi.com/?s=#{keyword}&type=movie&apikey=3f96a270")
        results_hash = JSON.parse(response.body)
        results_array =  results_hash["Search"]
     end
end
