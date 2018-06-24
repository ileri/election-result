class AddShortNameToParty < ActiveRecord::Migration[5.1]
  def change
    add_column :parties, :short_name, :string
  end
end
