class CreateJuridicalActionTypes < ActiveRecord::Migration
  def change
    create_table :juridical_action_types do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
