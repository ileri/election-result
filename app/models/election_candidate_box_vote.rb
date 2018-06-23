class ElectionCandidateBoxVote < ApplicationRecord
  belongs_to :election
  belongs_to :candidate
  belongs_to :box
end
