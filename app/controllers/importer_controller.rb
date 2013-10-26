class ImporterController < ApplicationController
  # GET /importer
  # GET /importer/show
  def show
  end

  # POST /importer/run
  def run
  	require 'nokogiri'
	require 'rest-client'
	
	# @TODO pull out condition into global config
	# @TODO? figure out how to do this off the internet and not out of the assets/xml_files folder
	# starting_url = "http://clinicaltrials.gov/ct2/results/download?down_stds=all&down_typ=study&recr=Open&no_unk=Y&cond=brain%20tumor&show_down=Y"
	# response = RestClient.get(starting_url)
	# parsed_response = Nokogiri::XML(response)
	
	Dir["#{Rails.root}/public/xml_files/*.xml"].each do |file| 
		f = File.open(file)
		doc = Nokogiri::XML(f)
		root = doc.root


		# @TODO? Add method to put in if else conditional logic
		def get_from_xpath(path_and_name,root)
			if root.at_xpath("#{path_and_name}").nil?
				return ""	
			else
				return root.at_xpath("#{path_and_name}").text
			end

		end

		@trial = Trial.new
		@trial.title = get_from_xpath("brief_title",root)
		@trial.description = get_from_xpath("brief_summary",root)
		@trial.sponsor = get_from_xpath("sponsors",root)
		@trial.focus = get_from_xpath("condition",root) # @TODO? NEED TO JOIN COMMA SEPERATED
		@trial.country = get_from_xpath("location_countries",root)  #redundant
		@trial.nct_id = get_from_xpath("//nct_id",root)
		@trial.official_title = get_from_xpath("official_title",root)
		@trial.agency_class = get_from_xpath("//agency_class",root)
		
		# @TODO Clean this up to be shorter
		# if get_from_xpath("//detailed_description"),root.nil?
		# 	@trial.detailed_description = ""	
		# else
		# 	@trial.detailed_description = get_from_xpath("//detailed_description",root)
		# end

		@trial.overall_status = get_from_xpath("//overall_status",root)
		@trial.phase = get_from_xpath("//phase",root)
		@trial.study_type = get_from_xpath("//study_type",root)
		@trial.condition = get_from_xpath("condition",root) #redundant
		@trial.inclusion = get_from_xpath("//criteria",root)
		@trial.exclusion = get_from_xpath("//criteria",root)
		@trial.gender = get_from_xpath("//gender",root)
		@trial.minimum_age = get_from_xpath("//minimum_age",root)
		@trial.maximum_age = get_from_xpath("//maximum_age",root)
		@trial.healthy_volunteers = get_from_xpath("//healthy_volunteers",root)
		@trial.overall_contact_name = get_from_xpath("//overall_contact",root) # @TODO? figure out how to get the child element
		@trial.overall_contact_phone = get_from_xpath("//overall_contact",root) # @TODO? figure out how to get the child element
		@trial.overall_contact_email = get_from_xpath("//overall_contact",root) # @TODO? figure out how to get the child element
		@trial.location_countries = get_from_xpath("location_countries",root)
		@trial.link_url = get_from_xpath("///url",root)
		@trial.link_description = get_from_xpath("///description",root) # @TODO? might be other descriptions
		@trial.firstreceived_date = get_from_xpath("firstreceived_date",root)
		@trial.lastchanged_date = get_from_xpath("lastchanged_date",root)
		@trial.verification_date = get_from_xpath("verification_date",root)
		@trial.keyword = get_from_xpath("keyword",root) # @TODO? NEED TO JOIN COMMA SEPERATED
		@trial.is_fda_regulated = get_from_xpath("is_fda_regulated",root)
	    @trial.has_expanded_access = get_from_xpath("has_expanded_access",root)
		
		@trial.save
		# respond_to do |format|
	 #      if @trial.save
	 #        format.html { redirect_to importer_show_path, notice: "Your Import Has Worked!" }
	 #      else
	 #        format.html { render json: @trial.errors, status: :unprocessable_entity }
	 #      end
	    f.close

	  end
	  #redirect_to importer_show_path, notice: "Your Import Has Worked!"

  end


		# GET TITLES
	# titles = parsed_response.search('item title')
	# tmpTitle = titles.first	

end

