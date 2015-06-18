class CreatePatrimonyTypeMaterials < ActiveRecord::Migration
  def change
    create_table :patrimony_type_materials do |t|
      t.string :name
      t.string :description
      t.integer :percentage
      t.integer :life_cycle
      t.boolean :status

      t.timestamps null: false
    end
  end
end
