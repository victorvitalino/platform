class CreateAttendanceAttendants < ActiveRecord::Migration
  def change
    create_table :attendance_attendants do |t|
      t.references :staff, index: true
      t.references :sector, index: true
      t.text       :description
      t.boolean    :status
      t.timestamps null: false
    end
  end
end
