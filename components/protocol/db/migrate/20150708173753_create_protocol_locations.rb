class CreateProtocolLocations < ActiveRecord::Migration
  def change
    create_table :protocol_locations do |t|
      t.string :shelf
      t.string :pile
      t.string :box
      t.text :observation
      t.references :assessment, index: true#, foreign_key: true
      t.references :sector, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
