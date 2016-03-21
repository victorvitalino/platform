class AddOldIdToAssessments < ActiveRecord::Migration
  def change
    add_column :protocol_assessments, :id_old, :integer
  end
end
