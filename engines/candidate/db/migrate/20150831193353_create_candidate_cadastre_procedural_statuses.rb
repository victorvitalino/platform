class CreateCandidateCadastreProceduralStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_procedural_statuses do |t|
      t.string :name
      t.text :observation
      t.references :adjunct_cadastre#, index: true, foreign_key: true
      t.references :procedural_status#, index: true#, foreign_key: true
      t.references :convocation, index: true#, foreign_key: true
      t.references :assessment, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
