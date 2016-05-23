class CreateProtocolSolicitations < ActiveRecord::Migration
  def change
    create_table :protocol_solicitations do |t|
      t.references :assessment, index: true#, foreign_key: true
      t.date :order_date
      t.references :staff, index: true#, foreign_key: true
      t.text :observation
      t.integer :priority

      t.timestamps null: false
    end
  end
end
