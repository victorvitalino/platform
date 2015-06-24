class CreateCmsNavs < ActiveRecord::Migration
  def change
    create_table :cms_navs do |t|
      t.string :name
      t.integer :target
      t.integer :order
      t.string :link_external
      t.integer :type_nav
      t.references :link_page, index: true, foreign_key: true
      t.references :link_post, index: true, foreign_key: true
      t.boolean :publish
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
