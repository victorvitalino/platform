class AddCoordinateToAddressUnit < ActiveRecord::Migration
  def change
    add_column :address_units, :coordinate, :string
  end
end
