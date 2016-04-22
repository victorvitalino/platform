class CreateCandidateCadastreAttendances < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_attendances do |t|
      
      t.references :cadastre, index: true 
      t.references :cadastre_mirror, index: true
      t.references :attendance_status, index: true, default: 4
      t.references :staff, index: true

      t.timestamps null: false
    end
  end
end
