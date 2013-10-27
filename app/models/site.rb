class Site < ActiveRecord::Base
	#attr_accessor :city, :state, :country, :zip_code
	belongs_to :trial  #, counter_cache: true
	#validates :zip_code, inclusion: ['free', 'premium', 'business']
	
	  # can also be an IP address

	geocoded_by :address
	after_validation :geocode

	def address
	  "6 constitution Ct. Montville NJ 07045"
	  #[:city, :state, :country, :zip_code].compact.join(', ')
	end

end
