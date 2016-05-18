class SearchedRolesController < ApplicationController
  def create
    artist_role = SearchedRole.find_or_create_by(role_id: params[:id], user_id: params[:user_id])
    message = {'status' => 'Changes Saved Successfully.'}
		render :json => message
  end

  def destroy
    artist = User.find(params[:id])
    user_searched_roles = artist.searched_roles
    if user_searched_roles
    	user_searched_roles.destroy_all
    	message = {'status' => 'Roles erased successfully.'}
		else
			400
			message = {'status' => 'Roles not erased!'}
    end
    render :json => message
  end
end
