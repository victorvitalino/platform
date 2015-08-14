class CreateAttendanceStationAttendants < ActiveRecord::Migration
  def change
    create_table :attendance_station_attendants do |t|
      t.references :attendant, index: true
      t.references :station, index: true 
      t.boolean    :status
      t.boolean    :supervisor
      t.references :counter, index: true
      t.timestamps null: false
    end
  end
end
