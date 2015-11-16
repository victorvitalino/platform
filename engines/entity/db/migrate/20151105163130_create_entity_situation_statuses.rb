class CreateEntitySituationStatuses < ActiveRecord::Migration
  def change
    create_table :entity_situation_statuses do |t|
      t.string :name 
      t.text    :description
      t.integer  :code
      t.boolean :status, default: true
      t.timestamps null: false
    end
    add_index :entity_situation_statuses, :code, unique: true
  end
end
