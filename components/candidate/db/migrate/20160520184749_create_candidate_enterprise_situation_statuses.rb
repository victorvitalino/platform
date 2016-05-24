class CreateCandidateEnterpriseSituationStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_enterprise_situation_statuses do |t|
      t.string :name 
      t.text  :description
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
