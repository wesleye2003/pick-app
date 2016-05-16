class RolesController < ApplicationController

  def index
    @roles = Role.all
    puts @roles
    render json: @roles
  end

  def show
    @role = Role.find(params[:id])
    render json: @role
  end

end
