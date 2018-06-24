class Alliance < ApplicationRecord
  belongs_to :election
  has_many :parties
end
