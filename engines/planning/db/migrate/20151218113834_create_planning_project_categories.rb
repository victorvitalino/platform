class CreatePlanningProjectCategories < ActiveRecord::Migration
  def change
    create_table :planning_project_categories do |t|
      t.string :title
      t.boolean :status, default:true

      t.timestamps null: false
    end
  end
end
