class CreatePlanningProblems < ActiveRecord::Migration
  def change
    create_table :planning_problems do |t|
      t.string :subject
      t.text :description
      t.integer :problem_type
      t.integer :risk_type
      t.date :identification
      t.date :due
      t.references :responsible, index: true#, foreign_key: true
      t.integer :situation

      t.timestamps null: false
    end
  end
end
