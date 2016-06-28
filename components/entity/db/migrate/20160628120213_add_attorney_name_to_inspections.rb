class AddAttorneyNameToInspections < ActiveRecord::Migration
  def change
    add_column :entity_inspections, :attorney_name, :string
  end
end
