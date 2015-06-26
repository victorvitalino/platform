class CreateCmsPosts < ActiveRecord::Migration
  def change
    create_table :cms_posts do |t|

      t.string  :title
      t.text    :resume
      t.text    :content
      t.date    :date
      t.boolean :publish
      t.boolean :slider
      t.string  :thumb
      t.string  :photo_author
      t.string  :photo_description
      t.boolean :active_photo
      t.string  :author
      t.string  :link
      t.references :post_category, index: true
      t.string  :thumbnail



      t.timestamps null: false
    end
  end
end
