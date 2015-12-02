class AddCodeToAttendanceStatus < ActiveRecord::Migration
  def change
    add_column :candidate_attendance_statuses, :code, :integer
  end
end
