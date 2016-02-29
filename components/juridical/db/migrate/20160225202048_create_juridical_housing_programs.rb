class CreateJuridicalHousingPrograms < ActiveRecord::Migration
  def change
    create_table :juridical_housing_programs do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
