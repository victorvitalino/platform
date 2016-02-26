class CreateJuridicalAdviceTypes < ActiveRecord::Migration
  def change
    create_table :juridical_advice_types do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
