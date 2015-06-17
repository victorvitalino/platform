class CreateConcourseProjects < ActiveRecord::Migration
  def change
    create_table :concourse_projects do |t|
      t.string :name
      t.text :description
      t.string :background
      t.string :logo
      t.date :start
      t.date :end
      t.time :hour_end
      t.integer :status

      t.boolean :registration_fee
      t.float   :fee_value
      
      t.references :project_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
