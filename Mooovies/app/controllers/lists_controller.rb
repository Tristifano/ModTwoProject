class ListsController < ApplicationController
    def new
    end

    def create
        @list = List.new
        @list.title = list_params
        @list.user = current_user
        @list.save
    end

    def list
        @list =  List.find_by(:id)
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
