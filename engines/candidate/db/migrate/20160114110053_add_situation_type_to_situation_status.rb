class AddSituationTypeToSituationStatus < ActiveRecord::Migration
  def change
    add_column :candidate_situation_statuses, :status, :integer
  end
end
