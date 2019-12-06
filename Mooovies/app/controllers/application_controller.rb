class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :logged_in?, :current_user, :movie_api_call
    def logged_in?
        !!current_user
    end
    
    def current_user
        @user =  User.find_by(id: session[:user_id])
    end

    def authorized
        unless logged_in?
          flash[:notice] = "You must be logged in to see this page"
          redirect_to login_path
        end
    end

    def movie_api_call(q, keyword)
        response =  RestClient.get("http://www.omdbapi.com/?#{q}=#{keyword}&type=movie&apikey=3f96a270")
        results_hash = JSON.parse(response.body)
    end
end


