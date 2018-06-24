class AddOrderToCandidate < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :order, :integer
  end
end
