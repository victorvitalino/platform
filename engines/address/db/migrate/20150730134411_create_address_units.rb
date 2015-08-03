class CreateAddressUnits < ActiveRecord::Migration
  def change
    create_table :address_units do |t|
      t.string :acron_block
      t.string :block
      t.string :acron_group
      t.string :group
      t.string :unit
      t.string :cep_unit
      t.string :area
      t.string :complete_address
      t.string :burgh
      t.boolean :sefaz
      t.boolean :donate
      t.date :date_donate
      t.date :date_iptu
      t.date :registration_iptu
      t.string :certificate
      t.references :situation_unit, index: true#, foreign_key: true
      t.references :type_use_unit, index: true#, foreign_key: true
      t.references :city, index: true
      t.integer :program

      t.timestamps null: false
    end
  end
end
