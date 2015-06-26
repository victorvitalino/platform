class CreateConcourseEnrollments < ActiveRecord::Migration
  def change
    create_table :concourse_enrollments do |t|
      t.string :title
      t.text :description
      t.date :start
      t.date :end
      t.boolean :status
      t.boolean :fee
      t.decimal :value_fee
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
