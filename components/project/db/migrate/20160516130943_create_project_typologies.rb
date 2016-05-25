class CreateProjectTypologies < ActiveRecord::Migration
  def change
    create_table :project_typologies do |t|
      
      t.string :name
      t.string :home_type
      t.string :private_area
      t.string :income_family
      t.string  :initial_value
      t.string  :end_value
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
