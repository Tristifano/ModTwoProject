class MoviesController < ApplicationController
    def index
        
    end

    def show
    end

    private

    def movie_api_call
       response =  RestClient.get("http://www.omdbapi.com/?s=#{}&apikey=3f96a270")
       results_hash = JSON.parse(response.body)
       results_array =  results_hash[:Search]
    end
end
