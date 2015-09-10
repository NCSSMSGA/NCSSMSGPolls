json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :name, :description, :election_id
  json.url candidate_url(candidate, format: :json)
end
