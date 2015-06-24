class CreateCmsNavCategories < ActiveRecord::Migration
  def change
    create_table :cms_nav_categories do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
