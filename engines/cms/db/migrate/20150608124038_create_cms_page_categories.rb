class CreateCmsPageCategories < ActiveRecord::Migration
  def change
    create_table :cms_page_categories do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
