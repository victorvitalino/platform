class CreateConcourseProjects < ActiveRecord::Migration
  def change
    create_table :concourse_projects do |t|
      t.string :name
      t.text :description

      t.string :logo
      t.string :header
      t.string :footer

      t.date :start
      t.date :end
      
      t.boolean :open

      t.references :project_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
