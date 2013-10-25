About this Project
=======


Goal
-----------


How to Get Involved
-----------



Questions to Answer
-----------


User Stories To Still Implement
-----------


Phase II Items
-----------


TODO:
Look into http://apps.who.int/trialsearch/Default.aspx

TODO


Model configuration:

RESOURCES
Trials
Site_Locations
Users

RELATIONSHIPS

Trial has_many Site_Locations
Site Location belongs_to Trial
User has_many Trials through Site_locations 

Dynamic changes on both ends. 



User has_many Trials :through Site_Locations
http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association
to 
Geocoder - lat-long. 30miles radius.

Nightly cron jobs - ;
Active::Record: Nokogiri - make a new active record do a diff.
.ischanges? if it is changed persist the new record.

Job part - 

Devise - admin namespacing. Approval process. Logic to write.
.gov_id null for these.

Email digests - wouldnt be too hard. State machine. 
Generate Changes - need to know what the previous one is. 
Update_at - ;

Directions??

Email swifter. 

Rails scheduler - nightly runs. Delayjob. Gem - ;

add disease to config/initializers  Use config.;


IMPORTER GEOCODING

	geocoded_by :address   # can also be an IP address

def address
  [street, city, state, country].compact.join(', ')
end

	after_validation :geocode, if :full_street_address_changed?          # auto-fetch coordinates	




user.location = 1
Trials.where(location: user.location) // Look into activerecord scopes	
// https://github.com/bswinnerton/babblings/blob/rails4redesign/app/models/post.rb

user.location = 2

Users has_many Site_Locations :through LookupTable
Site_Locations has_many Users :through LookupTable 


QUESTIONS: where should the matching logic live?
on the model before going into the table? Rerun the matching algorithm each night?
Do matches need to be stored in the DB or should it be displayed on run time? Take too long to load? Cache results?



Phase II Items
*http://apps.who.int/trialsearch/Default.aspx