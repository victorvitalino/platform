class AddStartParticipationToProject < ActiveRecord::Migration
  def change
    add_column :concourse_projects, :start_participation, :date
    add_column :concourse_projects, :end_participation,   :date
    add_column :concourse_projects, :text_participation,  :text
  end
end
