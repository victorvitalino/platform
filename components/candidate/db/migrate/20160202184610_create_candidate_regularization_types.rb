class CreateCandidateRegularizationTypes < ActiveRecord::Migration
  def change
    create_table :candidate_regularization_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
