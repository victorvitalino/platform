class CreateAttendanceActivities < ActiveRecord::Migration
  def change
    create_table :attendance_activities do |t|

      t.integer :cadastre_id,           index: true
      t.integer :activity_situation_id, index: true
      t.integer :staff_id,              index: true 
      
      t.timestamps null: false
    end
  end
end
