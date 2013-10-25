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
             sponsor: "Michael J. Fox Foundation for Parkinson's Research",
             country: 'USA', 
             focus: 'biomarkers'


Trial.create title: "Sanofi Trial",
             description: 'Trial to measure sanofi drug',
             sponsor: "Sanofi Pharmaceuticals",
             country: 'USA', 
             focus: 'cognitive issues'


Trial.create title: "Use of Wii with Parkinson's patients",
             description: "Testing the use of Wii in retirement homes",
             sponsor: "National Institute of Health",
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
    trial_id: 1,
    latitude: 40.7446747,
    longitude: -73.9757498

Site.create facility: "Stanford University",
    street_address: "430 Clipper St",
    street_address2: "Floor 10",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    zip_code: "94114",
    trial_id: 1,
    latitude: 37.7490883,
    longitude: -122.4347076

Site.create facility: "Google Headquarters",
    street_address: "1600 Amphitheatre Pkwy",
    street_address2: "Floor 10",
    city: "Mountain View ",
    state: "CA",
    country: "USA",
    zip_code: "94043",
    trial_id: 1,
    latitude: 37.422253,
    longitude: -122.084755

Site.create facility: "Mike's House",
    street_address: "6 Constitution Ct.",
    street_address2: "Floor 10",
    city: "Montville",
    state: "NJ",
    country: "USA",
    zip_code: "07045",
    trial_id: 1,
    latitude: 40.8806343,
    longitude: -74.3671951

Site.create facility: "Harvard University",
    street_address: "1 Main St",
    street_address2: "Floor 10",
    city: "Boston",
    state: "MA",
    country: "USA",
    zip_code: "02129",
    trial_id: 1,
    latitude: 42.3718636,
    longitude: -71.0623263

puts 'Finished seeding db'
