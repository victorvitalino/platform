class AddChecklistToAttendance < ActiveRecord::Migration
  def change
    add_reference :candidate_attendances, :checklist, index: true, array: true
  end
end
