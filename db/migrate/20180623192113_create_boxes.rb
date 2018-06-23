class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.integer :no
      t.string :name

      t.timestamps
    end
  end
end
