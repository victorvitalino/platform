class CreateAddressTypeUseUnits < ActiveRecord::Migration
  def change
    create_table :address_type_use_units do |t|
      t.string :description
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
