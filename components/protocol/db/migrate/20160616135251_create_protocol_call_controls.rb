class CreateProtocolCallControls < ActiveRecord::Migration
  def change
    create_table :protocol_call_controls do |t|
      t.time :time_start
      t.time :time_end
      t.string :phone_number
      t.string :interested
      t.text :observation
      t.references :staff, index: true
      t.references :assessment, index: true

      t.timestamps null: false
    end
  end
end
