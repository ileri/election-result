class AddElectionToParty < ActiveRecord::Migration[5.1]
  def change
    add_reference :parties, :election, foreign_key: true
  end
end
