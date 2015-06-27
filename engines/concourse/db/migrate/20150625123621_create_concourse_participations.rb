class CreateConcourseParticipations < ActiveRecord::Migration
  def change
    create_table :concourse_participations do |t|
      t.string :title
      t.string :description
      t.boolean :status
      t.date  :start
      t.date  :end
      t.references :project, index: true
      
      t.timestamps null: false
    end
  end
end
