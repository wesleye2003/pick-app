require 'soundcloud'
class UsersController < ApplicationController
	def index
		
	end

	def callback
		# create client object with app credentials
		client = Soundcloud.new(:client_id => '50e414afb9a9f00311445bd1b9990164',
		                        :client_secret => 'b599269690a3b1ce433c9fa3de01be74',
		                        :redirect_uri => 'https://floating-tor-67033.herokuapp.com/callback')

		# exchange authorization code for access token
		code = params[:code]
		p code
		access_token = client.exchange_token(:code => code)
		p access_token
	end
end
