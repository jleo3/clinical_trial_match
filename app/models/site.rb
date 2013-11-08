class Site < ActiveRecord::Base
	attr_accessor :city, :state, :country, :zip_code
	
	belongs_to :trial
	
	geocoded_by :address
	after_validation :geocode

	def address
		[city, state, country, zip_code].compact.join(', ')
	end

end

