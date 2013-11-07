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
			where(gender: ["Male", "Both"])
		elsif gender == "female"
			where(gender: ["Female", "Both"])

		end 
	}
	scope :search_for, -> (query) {
		where('title ILIKE :query OR description ILIKE :query', query: "%#{query}%")
	}


	scope :age, -> (age){
		if age.nil? || age == ""
			return
		else
			# @TODO drop sql from this and make it rubyesque. Can do an inbetween ..			
			where("minimum_age <= ? and maximum_age >= ?", age, age)
		end
	}

	# @TODO? Is this ok as scope and not a method?
	scope :close_to, -> (postal_code, travel_distance=100) {
		tmpIdArray = close_to_logic(postal_code, travel_distance)
		if tmpIdArray.nil?
			return self
		else
			where(id: tmpIdArray)
		end
	 }

def self.close_to_logic(postal_code, travel_distance)
		if postal_code.nil? || postal_code == ""
			return
		else
			# @TODO - download geocoders db.
			# coordinates = Geocoder.coordinates("#{postal_code}, United States")

			# if coordinates.nil? || coordinates == [49.100867, 1.968433]				
			# 	raise
			# else

			# 	self.all.find_each do |trial|
			# 		valid_sites = []
			# 		trial.sites.find_each do |site|
						
			# 			if site.near("#{postal_code}, US",travel_distance.to_i)
			# 			# if site.distance_from(coordinates) < travel_distance.to_i 
			# 				# site for this trial is valid
			# 				# create array to add.
			# 				valid_sites << site
			# 			end
			# 		end
						
			# 		if valid_sites.empty?
			# 			#self.find(trial.id).reject # struggle  maybe self.pop
			# 			#trial.reject // this does not work
			# 		end
			# 	end


			# 	return
			# # end
			[2,3,4,5,6]
		end	
end


	has_many :sites


	# def self.close_to(postal_code, travel_distance = 100)
	# 	if postal_code.nil? || postal_code == ""
	# 		return self
	# 	else
	# 		# @TODO - download geocoders db.
	# 		coordinates = Geocoder.coordinates("#{postal_code}, United States")
	# 		coordinates = [32.100867, 2.968433]

	# 		if coordinates.nil? || coordinates == [49.100867, 1.968433]				
	# 			raise
	# 		else

	# 			self.all.find_each do |trial|
	# 				valid_sites = []
	# 				trial.sites.find_each do |site|
						
	# 					if site.distance_from(coordinates) < travel_distance.to_i 
	# 						# site for this trial is valid
	# 						# create array to add.
	# 						valid_sites << site
	# 					end
	# 				end
						
	# 				if valid_sites.empty?
	# 					#self.find(trial.id).reject # struggle  maybe self.pop
	# 					#trial.reject // this does not work
	# 				end
	# 			end


	# 			return self
	# 		end
	# 	end
	# end

end
