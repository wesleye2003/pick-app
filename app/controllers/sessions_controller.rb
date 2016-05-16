class SessionsController < ApplicationController
  def create
    username = params[:username]
    password = params[:password]
    @user = User.find_by(username: username)
    if @user
      if @user.authenticate(password)
        session[:user_id] = @user.id
        render json: @user
      else
        400
      end
    else
      400
    end
  end

  def destroy
    user_id = params[:id]
    session.delete(:user_id)
    status 200
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
