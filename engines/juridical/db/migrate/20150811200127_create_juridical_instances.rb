class CreateJuridicalInstances < ActiveRecord::Migration
  def change
    create_table :juridical_instances do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
