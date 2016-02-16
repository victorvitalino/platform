class CreateConcourseSubscribes < ActiveRecord::Migration
  def change
    create_table :concourse_subscribes do |t|
      t.references :project, index: true#, foreign_key: true
      t.string :title
      t.boolean :fee
      t.references :type_guide, index: true#, foreign_key: true
      t.date :start
      t.date :end
      t.boolean :publish
      t.text :observation

      t.timestamps null: false
    end
  end
end
