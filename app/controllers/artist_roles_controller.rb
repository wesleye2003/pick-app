class ArtistRolesController < ApplicationController

  def create
  	artist = User.find(params[:id])
    artist_role = ArtistRole.find_or_create_by(role_id: params[:id], user_id: params[:user_id])
    message = {'status' => 'Changes Saved Successfully.'}
		render :json => message
  end

  def destroy
    artist = User.find(params[:id])
    artist_roles = artist.artist_roles
    if artist_roles
    	artist_roles.destroy_all
    	message = {'status' => 'Roles erased successfully.'}
		else
			400
			message = {'status' => 'Roles not erased!'}
    end
    render :json => message
  end

end
