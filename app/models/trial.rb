class Trial < ActiveRecord::Base
	validates :title, :description, :sponsor, :country, :focus, presence: true
	validates :nct_id, uniqueness: true
	scope :control?, -> (volunteer_type) {
		if volunteer_type == "control"
			where(healthy_volunteers: "Accepts Healthy Volunteers")
		end 
	}
	scope :gender, -> (gender) {
		if gender == "male"
			where(:gender => ["Male", "Both"])
		elsif gender == "female"
			where(:gender => ["Female", "Both"])

		end 
	}
	#scope :age, lambda { |age| where("minimum_age < ? AND maximum_age > ?", 3,100) } 

	# -> (age) {
	# 	age = age.to_i
	# 	where(:minimum_age = 5)
	# 	#	:minimum_age < age)
		
	# }


	has_many :sites


	# @TODO? Should I make min max age an int and strip text?
	def self.search_for(query)
		where('title ILIKE :query OR description ILIKE :query', query: "%#{query}%")
	end

	# @TODO Have close_to as its own method call in the controller rather than chaining. pass data into the close_to method
	# # https://gist.github.com/bswinnerton/7217911
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

								#@TODO return active record array. Look into geocoder... doing this for me
								# Trial.distancefor 
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
