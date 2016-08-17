class AddZoneIdToIndicationCadastres < ActiveRecord::Migration
  def change
    add_column :indication_cadastres, :zone_id, :integer
  end
end
