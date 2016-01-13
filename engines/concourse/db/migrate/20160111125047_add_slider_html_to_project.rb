class AddSliderHtmlToProject < ActiveRecord::Migration
  def change
    add_column :concourse_projects, :slider_html, :text
  end
end
