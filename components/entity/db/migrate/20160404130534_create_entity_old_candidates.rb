class CreateEntityOldCandidates < ActiveRecord::Migration
  def change
    create_table :entity_old_candidates do |t|
      t.references :old, index: true#, foreign_key: true
      t.references :cadastre, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
