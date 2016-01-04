class CreatePlanningTasks < ActiveRecord::Migration
  def change
    create_table :planning_tasks do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.references :project, index: true#, foreign_key: true
      t.date :due
      t.references :responsible, index: true#, foreign_key: true
      t.integer :order
      t.references :author, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
