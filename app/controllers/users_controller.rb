require 'soundcloud'
class UsersController < ApplicationController

	def create
		user = User.new(username: params[:username],
										 password: params[:password])
		if user.save
			render json: user
		else
			400
		end
	end

	def show
		user = User.find(params[:id])
		render json: user
	end


	def update
		user = User.find(params[:id])
		 if user.update(user_params)
		 	message = {'status' => 'Changes Saved Successfully.'}
			render :json => message
    else
			400
    end
	end

	def by_zip
		users = User.where(zipcode: params[:zip])
		render json: users
	end

	def pickings
		user = User.find(params[:id])
		pickings = user.pickings
		render json: pickings
	end

	def my_roles
		user = User.find(params[:id])
		my_roles = user.roles
		 render json: my_roles
	end

	def my_genres
		user = User.find(params[:id])
		my_genres = user.genres
		 render json: my_genres
	end

	def update_all_roles
		id = params[:id]
		params.delete(:id)
		user = User.find(id)
		user.roles.each do |role|
			role.destroy
		end
		params.delete(:id)
		params.each do |role|
			ArtistRole.new(user_id: id, role_id: role[id])
		end
	end

	def search
		user = User.find(params[:id])
		searched_roles = user.s_roles
		searched_users = []
		searched_roles.each do |role|
			searched_users.push(role.users)
		end
		searched_users.flatten!.uniq!
		searched_users.delete_if {|searched_user| user.pickings.include?(searched_user)}
		searched_users.delete_if {|searched_user| user.pending_picks.include?(searched_user)}
		render json: searched_users
	end


	private
	def user_params
    params.require(:user).permit(:username, :email, :password, :permalink, :avatar_url, :soundcloud_access_token, :soundcloud_id, :description, :zipcode)
  end

	# def callback
	# 	# create client object with app credentials
	# 	client = Soundcloud.new({:client_id => ENV['SOUNDCLOUD_CLIENT_ID'],
	# 				                  :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
	# 	                        :redirect_uri => 'http://localhost:3000/callback',
	# 	                        :display => 'popup'})

	# 	# exchange authorization code for access token
	# 	code = params[:code]
	# 	if params[:error]
	# 		redirect_to "/"
	# 	else
	# 		access_token = client.exchange_token(:code => code)
	# 		sc_auth = Soundcloud.new(:access_token => access_token.access_token)
	# 		sc_user = sc_auth.get('/me')
	# 		user = User.find_or_initialize_by(username: sc_user.username,
	# 																			avatar_url: sc_user.avatar_url,
	# 																			permalink: sc_user.permalink_url,
	# 																			soundcloud_id: sc_user.id)
	# 		user.soundcloud_access_token = access_token.access_token
	# 		if user.save
	# 			session[:user_id] = user.soundcloud_access_token
	# 		end
	# 	end

	# end

end
