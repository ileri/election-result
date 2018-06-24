class Box < ApplicationRecord
  has_many :election_candidate_box_votes
  has_many :election_party_box_votes
end
