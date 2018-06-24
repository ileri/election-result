class ChangeElectionCandidateBoxVote < ActiveRecord::Migration[5.1]
  def change
    change_table :election_candidate_box_votes do |t|
      t.change :vote_count, :integer, :default => 0
    end

    change_table :election_party_box_votes do |t|
      t.change :vote_count, :integer, :default => 0
    end
  end
end
