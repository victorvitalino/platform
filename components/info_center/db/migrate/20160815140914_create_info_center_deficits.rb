class CreateInfoCenterDeficits < ActiveRecord::Migration
  def change
    create_table :info_center_deficits do |t|
      t.string :name
      t.string :cpf
      t.string :phone
      t.string :address
      t.integer :lot_houses
      t.text :lot_people
      t.boolean :water
      t.boolean :light
      t.boolean :sidewalk
      t.boolean :sewer
      t.boolean :asphalt
      t.boolean :bathroom
      t.integer :total_bathroom
      t.boolean :kitchen
      t.text :roof
      t.boolean :slab
      t.boolean :contract
      t.text :document
      t.integer :people_living
      t.boolean :wall
      t.integer :room
      t.text :sleep_local
      t.boolean :rent
      t.string :rent_total
      t.string :buy_lot

      t.timestamps null: false
    end
  end
end
