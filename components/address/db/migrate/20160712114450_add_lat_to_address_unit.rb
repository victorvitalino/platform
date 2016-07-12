class AddLatToAddressUnit < ActiveRecord::Migration
  def change
    add_column :address_units, :lat, :string
    add_column :address_units, :lng, :string
  end
end
