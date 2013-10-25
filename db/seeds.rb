# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'Adding trials'
Trial.create title: "Parkinson's Progression Markers Initiative",
             description: 'A landmark biomarker study',
             country: 'USA', 
             focus: 'biomarkers'


Trial.create title: "Sanofi Trial",
             description: 'Trial to measure sanofi drug',
             country: 'USA', 
             focus: 'cognitive issues'


Trial.create title: "Use of Wii with Parkinson's patients",
             description: "Testing the use of Wii in retirement homes",
             country: 'Global', 
             focus: 'exercise'

puts 'Adding sites'

Site.create facility: "Columbia University",
    street_address: "300 East 34th St",
    street_address2: "Apt 4e",
    city: "New York",
    state: "NY",
    country: "USA",
    zip_code: "10018",
    trial_id: 1

Site.create facility: "Stanford University",
    street_address: "100 Main St",
    street_address2: "Floor 10",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    zip_code: "80001",
    trial_id: 1

puts 'Finished seeding db'
