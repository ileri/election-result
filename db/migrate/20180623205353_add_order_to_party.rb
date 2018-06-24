class AddOrderToParty < ActiveRecord::Migration[5.1]
  def change
    add_column :parties, :order, :integer
  end
end
