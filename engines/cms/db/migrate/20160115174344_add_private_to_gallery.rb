class AddPrivateToGallery < ActiveRecord::Migration
  def change
    add_column :cms_galleries, :private, :boolean
  end
end
