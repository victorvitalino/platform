class CreateCmsNavCategories < ActiveRecord::Migration
  def change
    create_table :cms_nav_categories do |t|

    	t.string :title
    	t.string	:code, unique: true
    	t.boolean :status
    	
      t.timestamps null: false
    end
  end
end
