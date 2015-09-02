class CreateCandidateKinAdjuncts < ActiveRecord::Migration
  def change
    create_table :candidate_kin_adjuncts do |t|
      t.string :income
      t.string :percent
      t.references :kin_type, index: true
      t.references :civil_state, index: true
      t.references :kin, index: true
      t.references :kinship, index: true
      t.boolean :copurchaser_flag

      t.timestamps null: false
    end
  end
end
