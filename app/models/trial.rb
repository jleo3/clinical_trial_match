class Trial < ActiveRecord::Base
	validates :title, :description, :sponsor, :country, :focus, presence: true
	validates :nct_id, uniqueness: true
	

  # These are great and I'm glad you gained so much experience with scopes!
  # Scopes tend to have high essential complexity because they need logical
  # operands to really be effective. Essential complexity is unavoidable,
  # but these scopes provide a great way to flex your unit testing muscle!
  # Every if statement provides at least two possible outcomes that
  # can be validated with unit tests.
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

	scope :type, -> (type){
		unless type == "all" || type.blank?
			if type == "int"
				where(study_type: "Interventional")
			elsif type == "obs"
				where(study_type: ["Observational","Observational [Patient Registry]"])
			end	
		end
	}

	scope :phase, -> (phase){
		unless phase == "all" || phase.blank?
			if phase == "1"
				where(phase: ["Phase 1","Phase 1/Phase 2" ])
			elsif phase == "2"
				where(phase: ["Phase 1/Phase 2","Phase 2","Phase 2/Phase 3"])
			elsif phase == "3"
				where(phase: ["Phase 3","Phase 2/Phase 3","Phase 3/Phase 4"])
			elsif phase == "4"
				where(phase: ["Phase 4","Phase 3/Phase 4"])
			elsif phase == "0"
				where(phase: "Phase 0")
			end	
		end
	}

	scope :fda, -> (fda){
		unless fda == "all" || fda.blank?
			if fda == "reg"
				where(is_fda_regulated: "Yes")
			elsif fda == "nreg"
				where(is_fda_regulated: "No")
			end	
		end
	}

	scope :focus, -> (focus){
		unless focus.blank?
			where('focus ILIKE :focus', focus: "%#{focus}%")
		end
	}

	scope :close_to, -> (coordinates, td=100) {
		if coordinates.blank?
			return
		else
			tmpIdArray = close_to_logic(coordinates, td)
			unless tmpIdArray.blank?
				where(id: tmpIdArray)
			end
		end
	 }

	has_many :sites



private

	def self.close_to_logic(coordinates, td)
		# ERIC's refactoring suggestion = self.all.collect { |trial| trial.sites }.flatten.select
		valid_sites = Site.all.near(coordinates,td.to_i)
		valid_trials = []
		valid_sites.each do |site|
			valid_trials << site.trial_id
			
		end
		valid_trials #[2,3,4,5,6,8]				
	end
end
