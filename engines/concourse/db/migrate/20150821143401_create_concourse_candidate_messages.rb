class CreateConcourseCandidateMessages < ActiveRecord::Migration
  def change
    create_table :concourse_candidate_messages do |t|
      t.references :candidate, index: true#, foreign_key: true
      t.text :message
      t.integer :message_type
      t.boolean :status

      t.timestamps null: false
    end
  end
end
