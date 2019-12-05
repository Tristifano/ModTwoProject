class ListsController < ApplicationController

    def new
        @list = List.new
    end

    def create
        @list = List.new
        @list.title = list_params[:title]
        @list.user = current_user
        @list.save
        redirect_to user_path(current_user)
    end

    def show
        @list =  List.find(params[:id])
    end

    def edit
    end
    
    def update
        @list.update(list_params)
    end

    def destroy
        @list = List.find_by(params[:id])
        @list.delete
    end

    private

    def list_params
        params.require(:list).permit(:title)
    end
end
