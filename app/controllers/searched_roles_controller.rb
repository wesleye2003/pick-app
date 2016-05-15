class SearchedRolesController < ApplicationController
  def create
    role = Role.find(params[:role_id])
    current_user.s_roles << role
  end

  def destroy
    role = Role.find(params[:id])
    s_role = current_user.s_roles.find_by(:role_id)
    s_role.destroy
  end
end
