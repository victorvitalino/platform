class CreatePlanningDiscussions < ActiveRecord::Migration
  def change
    create_table :planning_discussions do |t|
      t.string :title
      t.references :author, index: true#, foreign_key: true
      t.references :project, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
