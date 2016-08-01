class AddDescriptionToCmsVideos < ActiveRecord::Migration
  def change
    add_column :cms_videos, :description, :text
  end
end
