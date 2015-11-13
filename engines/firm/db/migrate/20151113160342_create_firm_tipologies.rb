class CreateFirmTipologies < ActiveRecord::Migration
  def change
    create_table :firm_tipologies do |t|
      t.string :name
      t.string :home_type
      t.string :private_area
      t.string :income_family
      t.float :initial_value
      t.float :end_value
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
