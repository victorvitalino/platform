class AddAddressToEntityOld < ActiveRecord::Migration
  def change
    add_column :entity_olds, :address, :string
    add_column :entity_olds, :cep, :string
    add_column :entity_olds, :pf_problem, :boolean
  end
end
