class CreateCmsPosts < ActiveRecord::Migration
  def change
    create_table :cms_posts do |t|
      t.string :title
      t.text :content
      t.references :post_category, index: true#, foreign_key: true
      t.boolean :slider
      t.string :thumb
      t.text :resume
      t.date :date
      t.boolean :publish

      t.timestamps null: false
    end
  end
end
