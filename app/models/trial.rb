class Trial < ActiveRecord::Base
	validates :title, :description, :sponsor, :country, :focus, presence: true
	validates :nct_id, uniqueness: true
	

	scope :control?, -> (vt) {
		if vt == "control"
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
		unless age.blank?
			where("minimum_age <= ? and maximum_age >= ?", age, age)
		end
	}

	# @TODO? Is this ok as scope and not a method?
	scope :close_to, -> (postal_code, td=100) {
		if postal_code.blank?
			return
		else
			tmpIdArray = close_to_logic(postal_code, td)
			unless tmpIdArray.blank?
				where(id: tmpIdArray)
			end
		end
	 }

def self.close_to_logic(postal_code, td)
			coordinates = Geocoder.coordinates("#{postal_code}, United States")
			if coordinates.blank? 			
				raise
			else
				# self.all.collect { |trial| trial.sites }.flatten.select
				self.all.each do |trial|
					valid_sites = []
					trial.sites.each do |site|
						
						if site.near(coordinates,td.to_i)
						# if site.distance_from(coordinates) < td.to_i 
							# site for this trial is valid
							# create array to add.
							valid_sites << site
						end
					end
						
					if valid_sites.empty?
						#self.find(trial.id).reject # struggle  maybe self.pop
						#trial.reject // this does not work
					end
				end			
			end
			[2,3,4,5,6,8]
end


	has_many :sites


	# def self.close_to(postal_code, td = 100)
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
						
	# 					if site.distance_from(coordinates) < td.to_i 
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
