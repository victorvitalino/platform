class AddColorToPosts < ActiveRecord::Migration
  def change
    add_column :cms_posts, :color, :string
  end
end
