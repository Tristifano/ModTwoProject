class MovielistsController < ApplicationController

    def new 
    end

    def create

        @new_movie =  Movie.new
        @movie = Movie.all.select { |m|
            m.properties["imdbID"] == params[:movielist][:imdbID]
           }
        if @movie.length == 0
            hash_movie = movie_api_call('i', params[:movielist][:imdbID])
            @new_movie.properties = hash_movie
            @new_movie.save
        else
            @new_movie = @movie[0]
        end
        @list = List.find_by(id: params[:movielist][:list_id])
        movielist = Movielist.create(
            list_id: @list.id,
            movie_id: @new_movie.id
        )
        redirect_to list_path(@list)
    end

    def destroy
        @movielist = Movielist.find_by(movie_id: params[:movie_id])
        @movielist.destroy
        redirect_to edit_list_path(params[:list_id])
    end 

    private

    def list_params
        params.require(:movielist).permit(:list_id, :imdbID)
    end
end
