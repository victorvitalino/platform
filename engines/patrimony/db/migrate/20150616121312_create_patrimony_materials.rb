class CreatePatrimonyMaterials < ActiveRecord::Migration
  def change
    create_table :patrimony_materials do |t|
      t.string :name
      t.string :description
      t.references :type_material, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
