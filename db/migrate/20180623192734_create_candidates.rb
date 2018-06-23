class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.references :election, foreign_key: true
      t.string :name
      t.string :photo

      t.timestamps
    end
  end
end
