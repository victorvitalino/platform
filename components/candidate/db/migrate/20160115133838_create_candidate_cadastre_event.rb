class CreateCandidateCadastreEvent < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_events do |t|
      t.references :staff, index: true#, foreign_key: true
      t.references :cadastre, index: true#@, foreign_key: true
      t.text :cadastre_old
      t.text :cadastre_new
      t.text :observation_staff
      t.text :observation_system
      t.integer :situation, default: 0
      t.boolean :status, default: true 
      
      t.timestamps null: false
    end
  end
end
