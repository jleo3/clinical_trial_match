class Site < ActiveRecord::Base
	belongs_to :trial  #, counter_cache: true
	#validates :zip_code, inclusion: ['free', 'premium', 'business']
	geocoded_by :address   # can also be an IP address

	def address
	  [street, city, state, country].compact.join(', ')
	end

	#after_validation :geocode, if :full_street_address_changed?

end
