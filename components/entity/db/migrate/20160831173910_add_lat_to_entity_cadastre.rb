class AddLatToEntityCadastre < ActiveRecord::Migration
  def change
    add_column :entity_cadastres, :lat, :string
    add_column :entity_cadastres, :lng, :string
  end
end
