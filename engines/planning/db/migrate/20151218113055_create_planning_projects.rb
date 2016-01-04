class CreatePlanningProjects < ActiveRecord::Migration
  def change
    create_table :planning_projects do |t|
      t.string :title
      t.text :description
      t.integer :level
      t.references :sector, index: true#, foreign_key: true
      t.references :project_category, index: true
      t.boolean :priority_visible

      t.timestamps null: false
    end
  end
end
