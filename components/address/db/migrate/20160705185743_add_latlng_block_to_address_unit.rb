class AddLatlngBlockToAddressUnit < ActiveRecord::Migration
  def change
  
    add_column :address_units, :latlng_block, :string
    add_column :address_units, :latlng_group, :string
    add_column :address_units, :latlng_unit,  :string
    add_column :address_units, :latlng_urb,   :string
  
  end
end
