class CreateAttendanceCadastreChecklists < ActiveRecord::Migration
  def change
    create_table :attendance_cadastre_checklists do |t|
      
      t.integer :cadastre_id,   index: true
      t.integer :checklist_id,  index: true
      t.boolean :authenticate,  default: false
      t.integer :staff_id,      index: true

      t.timestamps null: false
    end
  end
end
