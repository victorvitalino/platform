class CreateAttendanceCounterSubjects < ActiveRecord::Migration
  def change
    create_table :attendance_counter_subjects do |t|
      t.references :counter, index: true#, foreign_key: true
      t.references :subject, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
