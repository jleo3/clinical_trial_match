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

	Dir["#{Rails.root}/public/xml_files/*.xml"].each do |file| # .first(10) to limit import
		f = File.open(file)
		doc = Nokogiri::XML(f)
		root = doc.root

		#@TODO - move all of this to do model
		# @TODO? Put differnet levels in array and pass the array to get_from_xpath???
		def get_from_xpath(path_and_name, directory, merge=false)
			if directory.xpath("#{path_and_name}").nil?
				return ""	
			elsif merge
				tmpValue = ""
				directory.xpath("#{path_and_name}").each do |item|
					tmpValue << item.text + ", "
				end
				return tmpValue[0..-3]
			else
				return directory.xpath("#{path_and_name}").text
			end

		end

		@trial = Trial.new
		@trial.title = get_from_xpath("brief_title",root)
		@trial.description = get_from_xpath("brief_summary/textblock",root)
		@trial.detailed_description = get_from_xpath("detailed_description/textblock",root)
		@trial.sponsor = get_from_xpath("sponsors/lead_sponsor/agency",root)
		@trial.focus = get_from_xpath("condition",root,true)
		@trial.country = get_from_xpath("location_countries/country",root,true)  #redundant
		@trial.nct_id = get_from_xpath("//nct_id",root)
		@trial.official_title = get_from_xpath("official_title",root)
		@trial.agency_class = get_from_xpath("//agency_class",root)
		@trial.overall_status = get_from_xpath("//overall_status",root)
		@trial.phase = get_from_xpath("//phase",root)
		@trial.study_type = get_from_xpath("//study_type",root)
		@trial.condition = get_from_xpath("condition",root) #redundant
		@trial.inclusion = get_from_xpath("//criteria/textblock",root)
		@trial.exclusion = get_from_xpath("//criteria/textblock",root)
		@trial.gender = get_from_xpath("//gender",root)
		@trial.minimum_age.to_i = get_from_xpath("//minimum_age",root)
		@trial.maximum_age.to_i = get_from_xpath("//maximum_age",root)
		@trial.healthy_volunteers = get_from_xpath("//healthy_volunteers",root)
		@trial.overall_contact_name = get_from_xpath("//overall_contact/last_name",root)
		@trial.overall_contact_phone = get_from_xpath("//overall_contact/phone",root)
		@trial.overall_contact_email = get_from_xpath("//overall_contact/email",root)
		@trial.location_countries = get_from_xpath("location_countries/country",root,true)
		@trial.link_url = get_from_xpath("//link/url",root)
		@trial.link_description = get_from_xpath("//link/description",root) 
		@trial.firstreceived_date = get_from_xpath("firstreceived_date",root)
		@trial.lastchanged_date = get_from_xpath("lastchanged_date",root)
		@trial.verification_date = get_from_xpath("verification_date",root)
		@trial.keyword = get_from_xpath("keyword",root,true) 
		@trial.is_fda_regulated = get_from_xpath("is_fda_regulated",root)
	    @trial.has_expanded_access = get_from_xpath("has_expanded_access",root)
		
		doc.xpath("//location",root).each do |site|
	    	@site = Site.new
	    	@site.facility = get_from_xpath("facility/name",site)
	    	@site.city = get_from_xpath("facility/address/city",site)
	    	@site.state = get_from_xpath("facility/address/state",site)
	    	@site.zip_code = get_from_xpath("facility/address/zip",site)
	    	@site.country = get_from_xpath("facility/address/country",site)
	    	@site.status = get_from_xpath("status",site)

	    	@site.contact_name = get_from_xpath("contact/last_name",site)
	    	@site.contact_phone = get_from_xpath("contact/phone",site)
	    	@site.contact_phone_ext = get_from_xpath("contact/phone_ext",site)
	    	@site.contact_phone_email = get_from_xpath("contact/email",site)

			@trial.sites << @site
			@site.save
		end


		@trial.save

	    f.close
	    

	  end
	redirect_to root_path, notice: "All trials were successfully imported!"	 

  end


  def delete_all
  	@trial = Trial.all
  	@trial.each do |trial|
  		trial.destroy
  	end
  	redirect_to importer_show_path, notice: "All trials were deleted!"
  end

		# GET TITLES
	# titles = parsed_response.search('item title')
	# tmpTitle = titles.first	

end

