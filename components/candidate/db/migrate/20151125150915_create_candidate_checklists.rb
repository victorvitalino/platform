class CreateCandidateChecklists < ActiveRecord::Migration
  def change
    create_table :candidate_checklists do |t|
      t.string :name
      t.boolean :status, default: true
      t.string  :code
      t.references :program, index: true

      t.timestamps null: false
    end
  end
end
