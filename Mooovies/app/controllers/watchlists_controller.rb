class WatchlistsController < ApplicationController

    def new 
    end 

    def show
        @watchlist = current_user.watchlist
    end
end
