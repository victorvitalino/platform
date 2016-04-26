class CreateCandidateInheritorTypes < ActiveRecord::Migration
  def change
    create_table :candidate_inheritor_types do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
