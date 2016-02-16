class CreateCandidateProceduralStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_procedural_statuses do |t|
      t.string :name
      t.string :description
      t.string :code
      t.boolean :status, default: true
      t.timestamps null: false
    end

    add_index :candidate_procedural_statuses, :code, unique: true
  end
end
