class CreateConcourseCandidateTokens < ActiveRecord::Migration
  def change
    create_table :concourse_candidate_tokens do |t|
      t.references :candidate, index: true
      t.string :secret_key
      t.boolean :status, default: false

      t.timestamps null: false
    end

    add_index :concourse_candidate_tokens, :secret_key, unique: true
  end
end
