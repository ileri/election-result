class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :logo
      t.references :alliance, foreign_key: true

      t.timestamps
    end
  end
end
