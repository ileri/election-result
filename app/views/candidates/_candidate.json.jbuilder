json.extract! candidate, :id, :election_id, :name, :photo, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
