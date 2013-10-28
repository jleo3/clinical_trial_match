class Trial < ActiveRecord::Base
	validates :title, :description, :sponsor, :country, :focus, presence: true
	has_many :sites

	def self.search_for(query)
		where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
	end

	def self.close_to(postal_code = false, travel_distance = 100)
		if postal_code.nil?
			return Trial.all
		else
			location_within_distance = false

			location = Geocoder.search("#{postal_code} United States")
			lat = location[0].latitude
			long = location[0].longitude

			self.all.each do |trial|
				trial.sites.each do |site|
					tmpDistance = site.distance_from([lat,long])
						unless tmpDistance.nil?
						  	if tmpDistance.to_i < travel_distance.to_i
								location_within_distance = true
							end
						end
				end

			end
		end
		return Trial.all
#				if trial.site.distance_from([lat,long])}
#		binding.pry
#		@trial.sites.sort_by{|site| site.distance_from([40.7522926,-73.9900131])}


	end

end
