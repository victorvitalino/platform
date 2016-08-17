class CreateAttendanceTypes < ActiveRecord::Migration
  def change
    create_table :attendance_types do |t|
      
      t.string :title
      t.boolean :boolean,  default: true
      
      t.timestamps null: false
    end
  end
end
