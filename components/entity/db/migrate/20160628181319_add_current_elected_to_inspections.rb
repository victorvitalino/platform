class AddCurrentElectedToInspections < ActiveRecord::Migration
  def change
    add_column :entity_inspections, :current_elected, :date
  end
end
