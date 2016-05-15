class ArtistRolesController < ApplicationController

  def create
    role = Role.find(params[:role_id])
    current_user.roles << role
  end

  def destroy
    role = Role.find(params[:id])
    artist_role = current_user.artist_roles.find_by(:role_id)
    artist_role.destroy
  end

end
