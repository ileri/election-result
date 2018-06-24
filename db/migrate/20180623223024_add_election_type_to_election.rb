class AddElectionTypeToElection < ActiveRecord::Migration[5.1]
  def change
    add_reference :elections, :election_type, foreign_key: true
  end
end
