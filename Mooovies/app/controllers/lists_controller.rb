class ListsController < ApplicationController
    def index
        @lists = List.all
    end

    def new
        @list = List.new
    end

    def create
        byebug
        
        @list = List.new
        @list.title = list_params[:title]
        @list.user = current_user
        @list.save
        byebug
        @list.avatar.attach(list_params[:avatar])
        redirect_to user_path(current_user)
    end

    def show
        @list =  List.find(params[:id])
    end

    def edit
        @list = List.find(params[:id])
    end
    
    def update
        @list = List.find(params[:id])
        @list.update(list_params)
        redirect_to edit_list_path(@list)
    end

    def destroy
        @list = List.find(params[:id])
        @list.avatar.purge
        byebug
        @list.delete
        redirect_to user_path(current_user)
    end

    private

    def list_params
        params.require(:list).permit(:title, :user_id, :avatar)
    end
end
