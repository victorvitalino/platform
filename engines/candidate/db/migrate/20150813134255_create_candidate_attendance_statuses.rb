class CreateCandidateAttendanceStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_attendance_statuses do |t|
      t.string  :name
      t.integer :code, unique: true
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
