class CreateCandidateOcurrenceTypes < ActiveRecord::Migration
  def change
    create_table :candidate_ocurrence_types do |t|

      t.string :name
      t.boolean :status, default: true
      
      t.timestamps null: false
    end
  end
end
