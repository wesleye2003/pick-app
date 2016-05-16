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

  def nearby_zips(zip)
    #start with blank array
    zips = []
    zip_api_key = 'OqnfG0f7f7dfPhxfUlOSfRi4O0CJqxgfYEuEFKLURZaHgHWb3K3iCmmrmZbNws2v'
    radius_in_miles = "10"
    #assemble the URL
    url = "https://www.zipcodeapi.com/rest/#{zip_api_key}/radius.json/#{zip}/#{radius_in_miles}/mile"
    #hit the API, get a JSON object
    zip_hash = HTTParty.get(url)
    #get the data from the JSON object
    zip_array = zip_hash["zip_codes"]
    #iterate over the items in the JSON object and shovel into an output array
    zip_array.each do |zip_object|
      zips << zip_object["zip_code"]
    end
    zips
  end






end
