class ElectionType < ApplicationRecord
  has_many :elections
  validates :name, presence: true
  validates :option, presence: true
end
