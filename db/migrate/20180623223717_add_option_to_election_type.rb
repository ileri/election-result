class AddOptionToElectionType < ActiveRecord::Migration[5.1]
  def change
    add_column :election_types, :option, :string
  end
end
