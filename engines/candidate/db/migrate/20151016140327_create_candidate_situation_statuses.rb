class CreateCandidateSituationStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_situation_statuses do |t|
      t.string :name
      t.text :description
      t.integer :code

      t.timestamps null: false
    end

    add_index :candidate_situation_statuses, :code, unique: true
  end
end
