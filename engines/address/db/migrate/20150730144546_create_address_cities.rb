class CreateAddressCities < ActiveRecord::Migration
  def change
    create_table :address_cities do |t|
      t.string :name
      t.boolean :capital, default: true
      t.references :state, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
