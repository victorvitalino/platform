class CreateCandidateChecklists < ActiveRecord::Migration
  def change
    create_table :candidate_checklists do |t|
      t.string :name
      t.text :description
      t.string :help
      t.boolean :status
      t.references :checklist_type, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
