class AddSlugToPage < ActiveRecord::Migration
  def change
    add_column :cms_pages, :slug, :string
  end
end
