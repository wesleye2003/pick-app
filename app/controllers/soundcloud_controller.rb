require 'soundcloud'
class SoundcloudController < ApplicationController

  def connect
    session[:user_id] = params[:id]
    redirect_to soundcloud_client.authorize_url(:display => "popup")
  end

  def connected
    if params[:error].nil?
      soundcloud_client.exchange_token(:code => params[:code])
      me = soundcloud_client.get("/me")
      user = User.find(session[:user_id])
      current_user.update_attributes!({
        :soundcloud_id  => me.id,
        :permalink => me.permalink_url,
        :avatar_url => me.avatar_url,
        :soundcloud_access_token  => soundcloud_client.access_token
      })

    end
    render :layout => false
  end

  def disconnect
    login_as nil
    redirect_to root_path
  end

private

  def soundcloud_client
    return @soundcloud_client if @soundcloud_client
    @soundcloud_client = User.soundcloud_client(:redirect_uri  => soundcloud_connected_url)
  end



end
