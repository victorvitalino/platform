class CreateActionProfessions < ActiveRecord::Migration
  def change
    create_table :action_professions do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
