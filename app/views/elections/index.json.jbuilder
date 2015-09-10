json.array!(@elections) do |election|
  json.extract! election, :id, :name, :numcand, :start, :end
  json.url election_url(election, format: :json)
end
