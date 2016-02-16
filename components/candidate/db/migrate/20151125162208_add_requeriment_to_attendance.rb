class AddRequerimentToAttendance < ActiveRecord::Migration
  def change
    add_reference :candidate_attendances, :requeriment, index: true
  end
end
