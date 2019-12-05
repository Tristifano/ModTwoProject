class MoviesController < ApplicationController
    
    def index
        @movies = movie_api_call('s', params[:keyword])["Search"]
    end

    def show
       
       movie = Movie.all.select { |m|
        m.properties["imdbID"] == params[:id]
       }

       if movie.length == 0
            @movie = movie_api_call('i', params[:id])
       else
            @movie = movie[0].properties
            @reviews = movie[0].reviews
       end
    end

    private

    def movie_api_call(q, keyword)
        response =  RestClient.get("http://www.omdbapi.com/?#{q}=#{keyword}&type=movie&apikey=3f96a270")
        results_hash = JSON.parse(response.body)
    end
end
