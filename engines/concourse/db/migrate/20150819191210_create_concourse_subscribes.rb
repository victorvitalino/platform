class CreateConcourseSubscribes < ActiveRecord::Migration
  def change
    create_table :concourse_subscribes do |t|
      t.references :project, index: true#, foreign_key: true
      t.string :title
      t.float :fee_value
      t.references :bank_slip, index: true#, foreign_key: true
      t.date :start
      t.date :end
      t.boolean :publish
      t.text :observation

      t.timestamps null: false
    end
  end
end
