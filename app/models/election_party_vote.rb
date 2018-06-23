class ElectionPartyVote < ApplicationRecord
  belongs_to :election
  belongs_to :party
end
