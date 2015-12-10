class CreateEntityCandidates < ActiveRecord::Migration
  def change
    create_table :entity_candidates do |t|
      t.references :candidate, index: true#, foreign_key: true
      t.references :cadastre, index: true#, foreign_key: true
      t.boolean :status
      t.date :date_in
      t.date :date_out
      t.text :observation
      t.string :document
      t.boolean :accepted
      t.datetime :date_accepted

      t.timestamps null: false
    end
  end
end
