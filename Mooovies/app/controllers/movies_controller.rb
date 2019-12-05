class MoviesController < ApplicationController
    
    def index
        @movies = movie_api_call('s', params[:keyword])["Search"]
    end

    def show
       @movie = movie_api_call('i', params[:id])
    end

    private

    def movie_api_call(q, keyword)
        response =  RestClient.get("http://www.omdbapi.com/?#{q}=#{keyword}&type=movie&apikey=3f96a270")
        results_hash = JSON.parse(response.body)
     end
end
