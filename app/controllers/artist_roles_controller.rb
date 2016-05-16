class ArtistRolesController < ApplicationController

  def create
    artist_role = ArtistRole.find_or_create_by(role_id: params[:id], user_id: params[:user_id])
  end

  def destroy
    artist_role = ArtistRole.find_by(role_id: params[:id], user_id: params[:user_id])
    if artist_role
    	artist_role.destroy
    end
  end

end
