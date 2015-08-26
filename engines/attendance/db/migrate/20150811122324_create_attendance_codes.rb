class CreateAttendanceCodes < ActiveRecord::Migration
  def change
    create_table :attendance_codes do |t|
      t.integer :number
      t.boolean :preference
      t.references :station, index: true
      t.references :counter, index: true
      t.datetime   :start
      t.datetime   :end
      t.references :attendant, index: true
      t.integer    :status
      t.timestamps null: false
    end
  end
end
