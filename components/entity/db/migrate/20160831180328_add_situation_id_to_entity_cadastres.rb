class AddSituationIdToEntityCadastres < ActiveRecord::Migration
  def change
    add_column :entity_cadastres, :situation_id, :integer
  end
end
