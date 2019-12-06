class WatchlistmoviesController < ApplicationController
    def new
    end

    def create

        @new_movie =  Movie.new
        @movie = Movie.all.select { |m|
            m.properties["imdbID"] == params[:imdbID]
           }
        if @movie.length == 0
            hash_movie = movie_api_call('i', params[:imdbID])
            @new_movie.properties = hash_movie
            @new_movie.save
        else
            @new_movie = @movie[0]
        end
        wat = current_user.watchlist
        if wat 
            if !wat.movies.include?(@new_movie)
            @watchlist = wat
            new_watchlist_movie
            else
                redirect_to movie_path(@new_movie.properties["imdbID"])
            end
        else 
            @watchlist = Watchlist.create(user: current_user)
            new_watchlist_movie
            redirect_to watchlist_path(@watchlist)
        end
    end

    def destroy
        @watchlistmovie = Watchlistmovie.find_by(movie_id: params[:movie_id])
        @watchlistmovie.destroy
        redirect_to watchlist_path(wat)
    end 

    private

    def new_watchlist_movie

        watchlistmovie = Watchlistmovie.create(
            watchlist_id: @watchlist.id,
            movie_id: @new_movie.id 
        )
    end
end
