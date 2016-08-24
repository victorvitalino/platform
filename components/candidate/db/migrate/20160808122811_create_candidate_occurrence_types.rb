class CreateCandidateOccurrenceTypes < ActiveRecord::Migration
  def change
    create_table :candidate_occurrence_types do |t|

      t.string :name
      t.boolean :status, default: true
      
      t.timestamps null: false
    end
  end
end
