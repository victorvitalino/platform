class CreateAddressRegistryUnits < ActiveRecord::Migration
  def change
    create_table :address_registry_units do |t|
      t.integer :situation
      t.boolean :status
      t.references :unit, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
