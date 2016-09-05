class AddPropertyTypeToDeficit < ActiveRecord::Migration
  def change
    add_column :info_center_deficits, :property_type, :integer
  end
end
