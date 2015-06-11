class CreateCmsPosts < ActiveRecord::Migration
  def change
    create_table :cms_posts do |t|
      
      t.string   :title
      t.text    :resume
      t.text    :content
      t.date    :date
      t.boolean :publish
      t.boolean :slider
      t.string  :thumb
      t.references :post_category, index: true


      t.timestamps null: false
    end
  end
end
