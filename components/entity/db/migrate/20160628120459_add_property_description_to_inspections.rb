class AddPropertyDescriptionToInspections < ActiveRecord::Migration
  def change
    add_column :entity_inspections, :property_description, :text
  end
end
