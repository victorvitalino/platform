class CreateCandidateOccurrenceCadins < ActiveRecord::Migration
  def change
    create_table :candidate_occurrence_cadins do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
