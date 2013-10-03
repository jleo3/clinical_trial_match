json.array!(@trials) do |trial|
  json.extract! trial, :title, :description, :sponsor, :country, :focus
  json.url trial_url(trial, format: :json)
end
