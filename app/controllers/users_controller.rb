require 'soundcloud'
class UsersController < ApplicationController
	def index
		
	end

	def callback
		# create client object with app credentials
		client = Soundcloud.new(:client_id => '50e414afb9a9f00311445bd1b9990164',
		                        :client_secret => 'b599269690a3b1ce433c9fa3de01be74',
		                        :redirect_uri => 'http://localhost:3000/callback')

		# exchange authorization code for access token
		code = params[:code]
		if params[:error]
			redirect_to "/"
		else
			access_token = client.exchange_token(:code => code)
			p access_token.access_token
			sc_user = Soundcloud.new(:access_token => access_token.access_token)
			sc_user = sc_user.get('/me')
			user = User.new(soundcloud_id: sc_user.id)
			p user
			# if user.save
				# session[:user_id] = User.id
				p "Username:" + sc_user.username
				p "Avatar Url: " + sc_user.avatar_url
				p "Url: " + sc_user.permalink_url
			# end
		end

	end
end
d