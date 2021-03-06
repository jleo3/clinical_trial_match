Clinical Trial Match
=======


Project Goal
-----------
For individuals affected by a disease and interested in participating in a clinical trial, the <a href="http://clinicaltrials.gov/" target="_blank">ClinicalTrials.gov website</a> does not fully meet their needs.
* The search functionality is limited and complicated
* There is no way to send someone info for future trials that they would match to
* There are many observational trials that are not listed on ClinicalTrials.gov 

For the Parkinson's disease community, the Michael J. Fox Foundation has developed <a href="https://foxtrialfinder.michaeljfox.org/" target="_blank">Fox Trial Finder (FTF)</a> which parses the ct.gov RSS feed for pd trials and matches volunteer accounts to trials using a matching algorithm of several data points (location, controls accepted, medications, etc).

Several disease foundations have expressed interest in FTF's functionality as a means to better promote clinical trial participation opportuities amongst their community. This open source project's goal is to build out a simplified version of FTF that can be deployed to multiple foundations without large setup and maintenance overhead.

Other Similar Solutions For Reference:
* <a href="http://trialx.com/">http://trialx.com/</a>
* <a href="http://www.emergingmed.com/">http://www.emergingmed.com/</a>


How to Get Involved
-----------
I am new to Ruby on Rails so pull requests are welcome!
You can also take it offline by emailing me at mwenger at michaeljfox.org


User Stories/Features To Still Implement
-----------
<a href="http://shrouded-river-3637.herokuapp.com/" target="_blank">Access the Beta Site</a>

<!-- * Nearest site location on index page and on show page.
* Register with fields prefilled in by session
* Get email to send out with list of sites you match to.
* Confirm sign up process. Should I not let them advance until they are confirmed?
* Set up configuration so that disease condition and form inputs can flexibly be changed for future instances of the site CONDITION_TYPE = intializers/condition_type.rb   
* Figure out how to open up zip folder in rails for importer  (http://rubyzip.sourceforge.net/classes/Zip/ZipFileSystem.html)
* Finalize Trial and Site models and add validation
* Set up importer to use NCT_ID as unique identifier. And to update if it it already exists.
* Add Timestamp for importer. Probably need another table @TODO?
* Set up travis-ci for this project
* Automatically assign lat/long to user. Will use geocode
* Parse inclusion exclusion criteria
* Users will receive email digests of new matches. They can set the frequency (once a week, as soon as available). Will use Email Swifter @TODO? Does this mean I need to store in the users database what trials they match to? and note that it if has changed -->

Phase II Items
-----------
* Import clinical trial data from more sources. <a href="http://apps.who.int/trialsearch/Default.aspx" target="_blank">http://apps.who.int/trialsearch/Default.aspx</a> - (an international version of ClinicalTrials.gov)
* Add ability for trial teams to submit their trial to be added to the site. Add admin user role to approve these submissions.