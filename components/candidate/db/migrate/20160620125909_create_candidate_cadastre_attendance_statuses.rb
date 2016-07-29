class CreateCandidateCadastreAttendanceStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_attendance_statuses do |t|

      t.integer :cadastre_attendance_id, index: { name: 'index_cadastre_attendance_id'} 
      t.integer :attendance_status_id, index: { name: 'index_attendace_status_id'} 
      t.integer :staff_id, index: true 
      t.integer :mirror_id, index: true

      t.timestamps null: false
    end
  end
end
