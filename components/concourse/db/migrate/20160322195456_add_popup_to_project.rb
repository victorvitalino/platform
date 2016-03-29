class AddPopupToProject < ActiveRecord::Migration
  def change
    add_column :concourse_projects, :popup_publish, :boolean
    add_column :concourse_projects, :popup_title, :string
    add_column :concourse_projects, :popup_content, :text
  end
end
