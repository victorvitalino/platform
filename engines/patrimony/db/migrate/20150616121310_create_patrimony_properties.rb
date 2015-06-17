class CreatePatrimonyProperties < ActiveRecord::Migration
  def change
    create_table :patrimony_properties do |t|
      t.string :name
      t.string :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
