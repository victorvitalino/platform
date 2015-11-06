class CreateEntitySituations < ActiveRecord::Migration
  def change
    create_table :entity_situations do |t|
      t.references :cadastre, index: true
      t.references :cadastre_mirror, index: true
      t.references :situation_status, index: true
      t.references :staff, index: true
      t.timestamps null: false
    end
  end
end
