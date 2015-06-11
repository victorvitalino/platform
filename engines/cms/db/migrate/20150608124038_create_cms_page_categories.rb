class CreateCmsPageCategories < ActiveRecord::Migration
  def change
    create_table :cms_page_categories do |t|
      
      t.string :title
    	t.boolean :status
    	t.string :code, unique: true

      t.timestamps null: false
    end
  end
end
