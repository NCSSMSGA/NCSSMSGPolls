json.array!(@ballots) do |ballot|
  json.extract! ballot, :id, :user_id, :election_id
  json.url ballot_url(ballot, format: :json)
end
