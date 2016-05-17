class CreateProjectSteps < ActiveRecord::Migration
  def change
    create_table :project_steps do |t|
      t.references :enterprise, index: true
      t.string     :name
      t.text       :text      
      t.timestamps null: false
    end
  end
end
