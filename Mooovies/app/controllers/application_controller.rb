class ApplicationController < ActionController::Base
    def logged_in?
        !!session[:user_id]
    end
    
    def current_user
        if logged_in?
            @user =  User.find_by(id: session[:user_id])
        end
    end
end


