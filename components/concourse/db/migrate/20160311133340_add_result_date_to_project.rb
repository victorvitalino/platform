class AddResultDateToProject < ActiveRecord::Migration
  def change
    add_column :concourse_projects, :result_date, :string
  end
end
