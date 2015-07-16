class CreateProtocolAllotments < ActiveRecord::Migration
  def change
    create_table :protocol_allotments do |t|
      t.text :description
      t.boolean :status
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
