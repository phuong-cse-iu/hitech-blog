class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
  	# ||= if not then
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]

  end

  def logged_in?
  	# !! return true or false depends on condition/ Here return true if current_user exist, otherwise false
  	!!current_user

  end

  def require_user
  	# if not logged in
    if !logged_in?
      flash[:danger] = " You should log in first to perform that action"
      redirect_to root_path
    end
  end
end
