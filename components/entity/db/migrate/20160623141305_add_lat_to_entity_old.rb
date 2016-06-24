class AddLatToEntityOld < ActiveRecord::Migration
  def change
    add_column :entity_olds, :lat, :string
    add_column :entity_olds, :long, :string
  end
end
