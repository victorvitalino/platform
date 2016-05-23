class CreateProjectSteps < ActiveRecord::Migration
  def change
    create_table :project_steps do |t|
      t.references :enterprise, index: true
      t.string     :name
      t.text       :text     
      t.integer    :demand, default: 0
      t.string     :rii, default: '40' 
      t.string     :rie, default: '40'
      t.string     :old, default: '8'
      t.string     :special, default: '7'
      t.string     :vulnerable, default: '5'
      t.integer    :situation, default: 0
      t.boolean    :status, default: true

      t.references :creator, index: true
      
      t.timestamps null: false
    end
  end
end
