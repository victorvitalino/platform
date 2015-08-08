class CreateCandidateCivilStates < ActiveRecord::Migration
  def change
    create_table :candidate_civil_states do |t|

      t.string :name
      t.boolean :status 
      
      t.timestamps null: false
    end
  end
end
