class CreateCandidateValidations < ActiveRecord::Migration
  def change
    create_table :candidate_validations do |t|

      t.string  :name
      t.string  :description
      t.string  :code 
      t.string  :target_model_query
      t.string  :target_model_function
      t.boolean :contain, default: true
      t.text    :program_id, array: true
      t.integer :occurrence_situation_id, index: true

      t.boolean :status, default: true
      
      t.timestamps null: false
    end
  end
end
