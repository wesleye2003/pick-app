class PickingsController < ApplicationController
	def index
		user = User.find(params[:id])
		if user
			picks = user.pickings
			render json: picks
		else
			400
		end
	end

  def create
    user1 = User.find(params[:user_id])
    user2 = User.find(params[:id])
    if user1.pending_picks.include?(user2)
        user1.approve_picking(user2)
        picking.save
    else
        user1.request(user2)
    end
    render json: {success: true}
  end

end
