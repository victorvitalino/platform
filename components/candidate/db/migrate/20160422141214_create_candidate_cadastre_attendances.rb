class CreateCandidateCadastreAttendances < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_attendances do |t|
      
      t.references :cadastre, index: true 
      t.references :cadastre_mirror, index: true
      t.references :staff, index: true
      t.integer    :situation, default: 0
      t.integer    :attendance_type, default: 0

      t.timestamps null: false
    end
  end
end
