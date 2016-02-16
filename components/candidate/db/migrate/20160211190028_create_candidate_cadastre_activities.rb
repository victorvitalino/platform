class CreateCandidateCadastreActivities < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_activities do |t|
      
      t.references :cadastre, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true
      t.references :activity_status, index: true 
      
      t.integer :type_activity, default: 0
      t.boolean :status, default: true 
      t.integer :type_ocurrency, default: 0
      
      t.text :observation
      t.text :object_old
      t.text :object_new

      t.timestamps null: false
    end
  end
end
