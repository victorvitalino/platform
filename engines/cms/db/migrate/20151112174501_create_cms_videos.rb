class CreateCmsVideos < ActiveRecord::Migration
  def change
    create_table :cms_videos do |t|
      t.string :title
      t.string :url
      t.integer :position
      t.boolean :publish

      t.timestamps null: false
    end
  end
end
