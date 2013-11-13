Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :google
#  :google, :google_premier, :yandex
  # # to use an API key:
  # :api_key => "AIzaSyCs17R4Eav915EMHBRDQeTzlQZO6H57n_0",

  # # geocoding service request timeout, in seconds (default 3):
  # :timeout => 5,

  # # set default units to kilometers:
  # :units => :km,

  # caching (see below for details):
  #:cache => Redis.new,
  #:cache_prefix => "..."

)


# Geocoder.configure(:lookup => :google_premier, :api_key => ["AIzaSyCs17R4Eav915EMHBRDQeTzlQZO6H57n_0", client, channel])