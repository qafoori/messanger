class UsersController < ApplicationController

  before_action :redirect_if_logged_in, only: %i[new]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully signed in'
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
