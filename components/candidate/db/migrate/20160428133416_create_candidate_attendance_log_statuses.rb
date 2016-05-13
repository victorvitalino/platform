class CreateCandidateAttendanceLogStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_attendance_log_statuses do |t|
      t.string :name
      t.string :description
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
