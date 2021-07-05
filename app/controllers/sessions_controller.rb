class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, only: %i[new]


  def new; end

  def create
    username = params[:session][:username].downcase
    password = params[:session][:password]
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:alert] = 'There was something wrong, we can\'t find your account!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out successfully'
    redirect_to login_path
  end


end
