class CreateBrbCategories < ActiveRecord::Migration
  def change
    create_table :brb_categories do |t|
      t.string :name
      t.boolean :status
      t.float :default_value
      t.text :description

      t.timestamps null: false
    end
  end
end
