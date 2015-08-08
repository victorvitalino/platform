class CreateHelpdeskAttendants < ActiveRecord::Migration
  def change
    create_table :helpdesk_attendants do |t|
      t.string :code
      t.integer :type_attendant
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
