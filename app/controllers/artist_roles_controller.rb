class ArtistRolesController < ApplicationController

  def create
  	artist = User.find_by(params[:id])
    artist_role = ArtistRole.find_or_create_by(role_id: params[:id], user_id: params[:user_id])
  end

  def destroy
    artist = User.find_by(params[:id])
    artist_roles = artist.artist_roles
    if artist_roles
    	artist_roles.destroy_all
    end
  end

end
