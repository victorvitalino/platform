class CreateJuridicalInstancies < ActiveRecord::Migration
  def change
    create_table :juridical_instancies do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
