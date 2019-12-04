class UsersController < ApplicationController
    # before_action :require_login
    
    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end
    
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path user
        else
            flash[:errors] = user.errors.full_messages
            redirect_to signup_path
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

    # def require_login
    #     return head(:forbidden) unless session.include? :user_id
    # end
end
