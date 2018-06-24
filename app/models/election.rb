class Election < ApplicationRecord
  belongs_to :election_type
  has_many :candidates
  has_many :parties
  has_many :election_candidate_box_votes
  has_many :election_party_box_vote
end
