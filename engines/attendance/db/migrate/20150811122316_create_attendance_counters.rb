class CreateAttendanceCounters < ActiveRecord::Migration
  def change
    create_table :attendance_counters do |t|
      t.references :station, index: true
      t.references :counter_subject, index: true
      t.boolean    :preference, default: false
      t.boolean    :status, default: false
      t.integer    :number, default: 1
      t.timestamps null: false
    end
  end
end
