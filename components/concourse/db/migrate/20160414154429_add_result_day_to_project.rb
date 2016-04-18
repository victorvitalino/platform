class AddResultDayToProject < ActiveRecord::Migration
  def change
    add_column :concourse_projects, :result_day,  :date
    add_column :concourse_projects, :result_hour, :time
  end
end
