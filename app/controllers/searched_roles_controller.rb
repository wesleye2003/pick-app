class SearchedRolesController < ApplicationController
  def create
    role = Role.find(params[:role_id])
    current_user.s_roles << role
  end

  def destroy
    role = Role.find(params[:id])
    searched_role = current_user.searched_roles.find_by(:role_id)
    searched_role.destroy
  end
end
