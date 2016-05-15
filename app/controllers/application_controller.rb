class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def logged_in?
    !!current_user
  end


  def current_user
    @current_user
  end

  def login_as(user)
    @current_user = user
    session[:current_user_id] = user.try(:id)
  end

  def login_from_session
    @current_user = User.find_by_id(session[:current_user_id])
  end




  # private
  #   def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   end
  #   helper_method :current_user
end
