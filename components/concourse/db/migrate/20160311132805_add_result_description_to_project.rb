class AddResultDescriptionToProject < ActiveRecord::Migration
  def change
    add_column :concourse_projects, :result_description, :text
  end
end
