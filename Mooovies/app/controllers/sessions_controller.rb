class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      render :form
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:notice] = "Email or password is invalid"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to main_page_path
  end
end
