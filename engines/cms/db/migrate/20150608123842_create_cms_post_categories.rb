class CreateCmsPostCategories < ActiveRecord::Migration
  def change
    create_table :cms_post_categories do |t|
     
    	t.string :title
    	t.boolean :status
    	t.string :code, unique: true

      t.timestamps null: false
    end
  end
end
