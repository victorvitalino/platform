class CreateCandidateActivityStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_activity_statuses do |t|
      t.string :title
      t.boolean :status, default: true
      t.integer :code

      t.timestamps null: false
    end

    add_index :candidate_activity_statuses, :code, unique: true
  end
end
