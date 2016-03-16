class AddUrbToAddressUnit < ActiveRecord::Migration
  def change
    add_column :address_units, :urb, :string
  end
end
