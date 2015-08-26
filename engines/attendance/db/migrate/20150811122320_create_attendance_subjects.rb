class CreateAttendanceSubjects < ActiveRecord::Migration
  def change
    create_table :attendance_subjects do |t|
      t.string  :name 
      t.boolean :status
      t.timestamps null: false
    end
  end
end
