class Party < ApplicationRecord
  belongs_to :election
  belongs_to :alliance, optional: true
  mount_uploader :logo, PartyOrCandidateUploader
  has_many :election_candidate_box_votes
  has_many :election_party_box_votes
end
