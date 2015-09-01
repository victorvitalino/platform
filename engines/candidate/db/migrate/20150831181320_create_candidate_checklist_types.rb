class CreateCandidateChecklistTypes < ActiveRecord::Migration
  def change
    create_table :candidate_checklist_types do |t|
      t.string :name
      t.boolean :status
      t.string :code

      t.timestamps null: false
    end
  end
end
