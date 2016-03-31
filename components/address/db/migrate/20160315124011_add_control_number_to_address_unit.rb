class AddControlNumberToAddressUnit < ActiveRecord::Migration
  def change
    add_column :address_units, :control_number, :integer
  end
end
