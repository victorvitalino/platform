class CreatePlanningDiscussionMessages < ActiveRecord::Migration
  def change
    create_table :planning_discussion_messages do |t|
      t.references :author, index: true#, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
