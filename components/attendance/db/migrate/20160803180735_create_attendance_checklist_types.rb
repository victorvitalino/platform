class CreateAttendanceChecklistTypes < ActiveRecord::Migration
  def change
    create_table :attendance_checklist_types do |t|

      t.string :name 
      t.boolean :status, default: true
      t.integer :program_id, index: true
      
      t.timestamps null: false
    end
  end
end
