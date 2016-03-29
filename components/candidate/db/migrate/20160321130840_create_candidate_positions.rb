class CreateCandidatePositions < ActiveRecord::Migration
  def change
    create_table :candidate_positions do |t|
      t.references :cadastre, index: true#, foreign_key: true
      t.references :pontuation, index: true#, foreign_key: true
      t.integer :position
      t.references :program, index: true#, foreign_key: true
      t.integer :zone

      t.timestamps null: false
    end
  end
end
