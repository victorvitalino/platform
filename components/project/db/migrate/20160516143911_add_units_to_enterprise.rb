class AddUnitsToEnterprise < ActiveRecord::Migration
  def change
    add_column :project_enterprises, :units, :string
  end
end
