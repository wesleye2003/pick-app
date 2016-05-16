module ApplicationHelper
  
  def logged_in?
    !!current_user
  end


  def current_user
    @current_user ||= 
  end

  def login_as(user)
    @current_user = user
    session[:user_id] = user.try(:id)
  end

  def login_from_session
    @current_user = User.find_by_id(session[:user_id])
  end

end
