class RolesController < ApplicationController

  def index
    @roles = Roll.all
    render json: @roles
  end

  def show
    @role = Role.find(params[:id])
    render json: @role
  end

end
