class SitesController < ApplicationController

private

	def sites_params
		params.require(:site).permit(:city, :state, :country, :zip_code, :latitude, :longitude)  
	end

end