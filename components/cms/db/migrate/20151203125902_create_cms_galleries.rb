class CreateCmsGalleries < ActiveRecord::Migration
  def change
    create_table :cms_galleries do |t|
      t.string :title
      t.text :content
      t.boolean :status
      t.string :thumbnail
      t.string :photo, array: true, default: []

      t.timestamps null: false
    end
  end
end
