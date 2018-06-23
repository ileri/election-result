class CreateElections < ActiveRecord::Migration[5.1]
  def change
    create_table :elections do |t|
      t.string :name
      t.integer :year
      t.boolean :active
      t.boolean :publishable

      t.timestamps
    end
  end
end
