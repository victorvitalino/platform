class CreateAttendanceChecklists < ActiveRecord::Migration
  def change
    create_table :attendance_checklists do |t|

      t.string :name 
      t.boolean :status, default: true 
      t.string  :code
      t.integer :checklist_type_id, index: true 
      
      t.timestamps null: false
    end
  end
end
