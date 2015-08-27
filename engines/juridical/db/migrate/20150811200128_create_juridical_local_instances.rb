class CreateJuridicalLocalInstances < ActiveRecord::Migration
  def change
    create_table :juridical_local_instances do |t|
      t.string :name
      t.text :description
      t.references :instance, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
