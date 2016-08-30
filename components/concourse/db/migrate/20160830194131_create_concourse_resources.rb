class CreateConcourseResources < ActiveRecord::Migration
  def change
    create_table :concourse_resources do |t|
      t.integer :project_id, index: true
      t.text    :message
      t.integer :candidate_id, index: true
      t.integer :situation, default: 0
      t.text    :observation

      t.timestamps null: false
    end
  end
end
