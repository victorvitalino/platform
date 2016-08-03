class CreateAttendanceActivitySituations < ActiveRecord::Migration
  def change
    create_table :attendance_activity_situations do |t|

      t.string  :name
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
