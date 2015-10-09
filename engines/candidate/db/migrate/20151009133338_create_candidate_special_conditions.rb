class CreateCandidateSpecialConditions < ActiveRecord::Migration
  def change
    create_table :candidate_special_conditions do |t|
      t.string :name
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
