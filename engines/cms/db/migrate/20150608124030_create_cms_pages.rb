class CreateCmsPages < ActiveRecord::Migration
  def change
    create_table :cms_pages do |t|
      
    	t.string 	:title
    	t.text		:content
    	t.date		:date
    	t.boolean	:publish
    	t.string	:thumb
    	
    	t.references :page_category, index: true
      t.timestamps null: false
    end
  end
end
