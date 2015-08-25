class CreateConcourseParticipations < ActiveRecord::Migration
  def change
    create_table :concourse_participations do |t|
      t.references :project, index: true#, foreign_key: true
      t.string :title
      t.date :start
      t.date :end
      t.boolean :publish
      t.text :observation
      t.references :subscribe, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
