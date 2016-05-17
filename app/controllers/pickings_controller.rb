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

end
