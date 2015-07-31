class CreateAddressStates < ActiveRecord::Migration
  def change
    create_table :address_states do |t|
      t.string :name
      t.string :acronym

      t.timestamps null: false
    end
  end
end
