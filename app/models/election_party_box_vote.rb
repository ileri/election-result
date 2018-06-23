class ElectionPartyBoxVote < ApplicationRecord
  belongs_to :election
  belongs_to :party
  belongs_to :box
end
