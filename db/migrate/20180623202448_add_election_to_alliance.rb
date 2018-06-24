class AddElectionToAlliance < ActiveRecord::Migration[5.1]
  def change
    add_reference :alliances, :election, foreign_key: true
  end
end
