class AddDateToGallery < ActiveRecord::Migration
  def change
    add_column :cms_galleries, :date, :date
  end
end
