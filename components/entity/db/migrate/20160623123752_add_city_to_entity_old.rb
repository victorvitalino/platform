class AddCityToEntityOld < ActiveRecord::Migration
  def change
    add_column :entity_olds, :city, :string
  end
end
