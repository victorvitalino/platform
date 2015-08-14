class CreateAttendanceStations < ActiveRecord::Migration
  def change
    create_table :attendance_stations do |t|
      
      t.string  :name
      t.references :city, index: true
      t.integer    :station_type
      t.references :convocation, index: true
      t.boolean    :status

      t.timestamps null: false
    end
  end
end
