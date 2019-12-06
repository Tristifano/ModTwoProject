class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
    
    def new
        if current_user
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end

    def show
        @user = User.find(current_user.id)
    end
    
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path user
        else
            flash[:errors] = user.errors.full_messages
            redirect_to signup_path
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
