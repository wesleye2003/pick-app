require 'soundcloud'
class SoundcloudController < ApplicationController

    SOUNDCLOUD_CLIENT_ID="b438fba7603a31dc48a8ca2dd68208ae"
    SOUNDCLOUD_CLIENT_SECRET="f120405ccadb81498d01d00ce68fcefd"

  def connect
    redirect_to soundcloud_client.authorize_url(:display => "popup")
  end

  def connected
    if params[:error].nil?
      soundcloud_client.exchange_token(:code => params[:code])
      me = soundcloud_client.get("/me")
      p me.id

      login_as User.find_or_create_by({
        :soundcloud_user_id  => me.id,
        :soundcloud_username => me.username
      })

      current_user.update_attributes!({
        :soundcloud_access_token  => soundcloud_client.access_token,
        :soundcloud_refresh_token => soundcloud_client.refresh_token,
        :soundcloud_expires_at    => soundcloud_client.expires_at,
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
