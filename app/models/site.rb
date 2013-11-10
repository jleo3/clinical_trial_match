class Site < ActiveRecord::Base
	
	belongs_to :trial
	
	#TODO? City is not populating in the database.	
	geocoded_by :address
	after_validation :geocode

	def address
		[city, state, country, zip_code].compact.join(', ')
	end

end

