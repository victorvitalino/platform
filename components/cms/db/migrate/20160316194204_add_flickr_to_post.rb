class AddFlickrToPost < ActiveRecord::Migration
  def change
    add_column :cms_posts, :flickr, :string
  end
end
