class SessionsController < ApplicationController
  def create
    username = params[:username]
    password = params[:password]
    @user = User.find_by(username: username)
    if @user
      if @user.authenticate(password)
        session[:user_id] = @user.id
        status 200
        render json: @user
      else
        status 400
      end
    else
      status 400
    end
  end

  # def destroy
  #   id = params[:id]
  #   session
  #   status 200
  # end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
