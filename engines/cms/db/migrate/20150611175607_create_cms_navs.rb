class CreateCmsNavs < ActiveRecord::Migration
  def change
    create_table :cms_navs do |t|

    	t.string	:title
    	t.string	:href
    	t.integer	:target
    	t.references	:internal_link, index: true
    	t.string	:external_link
    	t.references :nav_category, index: true
    	t.integer	:order
    	t.boolean :status

      t.timestamps null: false
    end
  end
end
