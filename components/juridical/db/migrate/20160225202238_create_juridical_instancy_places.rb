class CreateJuridicalInstancyPlaces < ActiveRecord::Migration
  def change
    create_table :juridical_instancy_places do |t|
      t.string :name
      t.text :description
      t.boolean :status
      t.references :instancy, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
