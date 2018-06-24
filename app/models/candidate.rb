class Candidate < ApplicationRecord
  mount_uploader :photo, PartyOrCandidateUploader 
  belongs_to :election
  has_many :election_candidate_box_votes
  has_many :election_party_box_votes
end
