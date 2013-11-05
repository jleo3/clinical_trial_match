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
	scope :search_for, -> (query) {
		where('title ILIKE :query OR description ILIKE :query', query: "%#{query}%")
	}

	scope :age, -> (age){
		if age.nil? || age == ""
			return
		else
			where("minimum_age <= ? and maximum_age >= ?", age, age)
		end
	}
	scope :close_to, -> (postal_code, travel_distance=100) {
		if postal_code.nil? || postal_code == ""
			return
		else
			coordinates = Geocoder.coordinates("#{postal_code}, United States")
			if coordinates.nil? || coordinates == [39.49593, -98.990005]
				return
			else
				raise
			end
		end
	}


	has_many :sites


# 	def self.close_to(postal_code, travel_distance = 100)
# 		if postal_code.nil?
# 			return
# 		else
# 			# location_within_distance = false

# 			# location = Geocoder.search("#{postal_code} United States")
# 			# lat = location[0].latitude
# 			# long = location[0].longitude

# 			# self.all.each do |trial|
# 			# 	trial.sites.each do |site|
# 			# 		tmpDistance = site.distance_from([lat,long])
# 			# 			unless tmpDistance.nil?
# 			# 			  	if tmpDistance.to_i < travel_distance.to_i
# 			# 					location_within_distance = true

# 			# 					#@TODO return active record array. Look into geocoder... doing this for me
# 			# 					# Trial.distancefor 
# 			# 				end
# 			# 			end
# 			# 	end

# 			# end
# 		end
# 		return Trial.all
# #				if trial.site.distance_from([lat,long])}
# #		binding.pry
# #		@trial.sites.sort_by{|site| site.distance_from([40.7522926,-73.9900131])}


# 	end

end
