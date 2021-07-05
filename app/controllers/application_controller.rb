class ApplicationController < ActionController::Base

  helper_method :current_user,
                :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = 'You must be logged in to perform that action'
      redirect_to login_path
    end
  end

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end

  def redirect_if_not_logged_in
    redirect_to login_path unless logged_in?
  end

end
