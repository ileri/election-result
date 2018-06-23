class ElectionCandidateVote < ApplicationRecord
  belongs_to :election
  belongs_to :candidate
end
