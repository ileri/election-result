json.extract! election, :id, :name, :year, :active, :publishable, :created_at, :updated_at
json.url election_url(election, format: :json)
