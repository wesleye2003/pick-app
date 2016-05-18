require 'soundcloud'
class UsersController < ApplicationController

  # zip_api_key = 'OqnfG0f7f7dfPhxfUlOSfRi4O0CJqxgfYEuEFKLURZaHgHWb3K3iCmmrmZbNws2v'

  def find_city(user_zip)
    zip_api_key = 'OqnfG0f7f7dfPhxfUlOSfRi4O0CJqxgfYEuEFKLURZaHgHWb3K3iCmmrmZbNws2v'
    # url = "https://www.zipcodeapi.com/rest/#{zip_api_key}/info.json/#{user.zipcode}/degrees"
    url = "https://www.zipcodeapi.com/rest/OqnfG0f7f7dfPhxfUlOSfRi4O0CJqxgfYEuEFKLURZaHgHWb3K3iCmmrmZbNws2v/info.json/#{user_zip}/degrees"
    response = HTTParty.get(url)
    city = response["city"]
  end

	def create
		# TODO: add method to reference dynamic image url
		user = User.new(username: params[:username],
										 password: params[:password],
                     zipcode: params[:zipcode],
                     avatar_url: 'http://i.imgur.com/yPyPWD4.png')
    city = find_city(user.zipcode)
    user.city = city unless city.empty?
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
    if params[:zipcode]
      city = find_city(params[:zipcode])
      user_params[:city] = city unless city.empty?
    end
		if user.update(user_params)
		 	message = {'status' => 'Changes Saved Successfully.'}
			render :json => message
    else
			400
			message = {'error' => 'Changes could not be applied.'}
      render :json => message
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

  def nearby_zips(zip)
    zip_api_key = 'OqnfG0f7f7dfPhxfUlOSfRi4O0CJqxgfYEuEFKLURZaHgHWb3K3iCmmrmZbNws2v'
    zips = [] #start with blank array
    radius_in_miles = "10" #this can be configured, of course
    url = "https://www.zipcodeapi.com/rest/#{zip_api_key}/radius.json/#{zip}/#{radius_in_miles}/mile" #assemble the URL
    zip_hash = HTTParty.get(url) #hit the API, get a JSON object
    zip_array = zip_hash["zip_codes"] #get the data from the JSON object
    zip_array.each do |zip_object| #iterate over the items in the JSON object and shovel into an output array
      zips << zip_object["zip_code"]
    end
    zips
  end

	def searched_users
		user = User.find(params[:id])
		searched_roles = user.s_roles
		searched_users = []
		searched_roles.each do |role|
			searched_users.push(role.users)
		end
		if searched_users
			searched_users.flatten!.uniq!.shuffle!
			searched_users.delete_if {|searched_user| user.pickings.include?(searched_user)}
			searched_users.delete_if {|searched_user| user.pending_picks.include?(searched_user)}
			acceptable_zips = nearby_zips(user.zipcode)
			searched_users.keep_if {|searched_user| acceptable_zips.include?(searched_user.zipcode)}
			searched_users.delete(user)

			render json: searched_users
		else
			400
			render json: {'status' => 'No potential picks found.'}
		end
	end

	def searched_roles
		user = User.find(params[:id])
		searched_roles = user.s_roles
		if searched_roles
			render json: searched_roles
		else
			400
			render json: {'status' => 'No searched roles found. Change your search criteria!'}
		end
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
