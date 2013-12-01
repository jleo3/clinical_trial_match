class SitesController < ApplicationController

private

  # If you have no other methods in this controller then this is not necessary.
	def sites_params
		params.require(:site).permit(:city, :state, :country, :zip_code, :latitude, :longitude)  
	end

end
