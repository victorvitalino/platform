class CreateActionFormationAreas < ActiveRecord::Migration
  def change
    create_table :action_formation_areas do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
