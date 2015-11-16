class CreateCandidateAttendances < ActiveRecord::Migration
  def change
    create_table :candidate_attendances do |t|
      t.references :cadastre, index: true#, foreign_key: true
      t.references :cadastre_mirror, index: true#, foreign_key: true
      t.references :convocation, index: true#, foreign_key: true
      t.references :attendance_status, index: true#, foreign_key: true
      t.references :staff, index: true
      
      t.text :observation

      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
