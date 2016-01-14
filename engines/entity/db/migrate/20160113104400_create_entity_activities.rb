class CreateEntityActivities < ActiveRecord::Migration
  def change
    create_table :entity_activities do |t|
      t.string :description
      t.date :start
      t.date :end
      t.string :observation
      t.integer :situation
      t.references :cadastre, index: true 

      t.timestamps null: false
    end
  end
end
