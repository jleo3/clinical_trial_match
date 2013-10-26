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
	# @TODO figure out how to do this off the internet and not out of the assets/xml_files folder
	# starting_url = "http://clinicaltrials.gov/ct2/results/download?down_stds=all&down_typ=study&recr=Open&no_unk=Y&cond=brain%20tumor&show_down=Y"
	# response = RestClient.get(starting_url)
	# parsed_response = Nokogiri::XML(response)
	
	f = File.open("#{Rails.root}/public/xml_files/NCT00001159.xml")
	doc = Nokogiri::XML(f)
	root = doc.root
	title = root.at_xpath("brief_title").text
	description = root.at_xpath("brief_summary").text
	sponsor = root.at_xpath("sponsors").text
	focus = root.at_xpath("condition").text
	country = root.at_xpath("location_countries").text


	@trial = Trial.new
	@trial.title = title
	@trial.description = description
	@trial.sponsor = sponsor
	@trial.focus = focus
	@trial.country = country
	
	respond_to do |format|
      if @trial.save
        format.html { redirect_to importer_show_path, notice: "Your Import Worked for #{title}" }
      else
        format.html { render json: @trial.errors, status: :unprocessable_entity }
      end
  end


	f.close
		# GET TITLES
	# titles = parsed_response.search('item title')
	# tmpTitle = titles.first	

  end
end
