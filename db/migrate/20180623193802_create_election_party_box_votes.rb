class CreateElectionPartyBoxVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :election_party_box_votes do |t|
      t.references :election, foreign_key: true
      t.references :party, foreign_key: true
      t.references :box, foreign_key: true
      t.integer :vote_count

      t.timestamps
    end
  end
end
