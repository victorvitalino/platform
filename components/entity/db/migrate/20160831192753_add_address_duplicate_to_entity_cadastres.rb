class AddAddressDuplicateToEntityCadastres < ActiveRecord::Migration
  def change
    add_column :entity_cadastres, :address_duplicate, :boolean
  end
end
