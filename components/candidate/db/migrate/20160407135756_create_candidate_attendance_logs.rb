class CreateCandidateAttendanceLogs < ActiveRecord::Migration
  def change
    create_table :candidate_attendance_logs do |t|
      t.references :cadastre_mirror, index: true#, foreign_key: true
      t.references :cadastre, index: true#, foreign_key: true
      t.string :content
      t.references :user, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
