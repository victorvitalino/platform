class CreateAttendanceCounters < ActiveRecord::Migration
  def change
    create_table :attendance_counters do |t|
      t.references :station, index: true
      t.references :subject, index: true
      t.boolean    :preference
      t.boolean    :status
      t.integer    :number
      t.timestamps null: false
    end
  end
end
