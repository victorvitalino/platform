class CreateCandidateVerifications < ActiveRecord::Migration
  def change
    create_table :candidate_verifications do |t|
      t.string :name
      t.string :description
      t.string :text_valid
      t.string :text_invalid
      t.integer :verification_type
      t.string :sql
      t.string :service
      t.references :program, index: true#, foreign_key: true
      t.string :code
      t.boolean :publish, default: true

      t.timestamps null: false
    end
  end
end
