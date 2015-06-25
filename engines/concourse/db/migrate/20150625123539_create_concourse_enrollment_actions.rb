class CreateConcourseEnrollmentActions < ActiveRecord::Migration
  def change
    create_table :concourse_subscribe_actions do |t|
      t.references :enrollment_candidate, index: true, foreign_key: true
      t.text :content
      t.boolean :status

      t.timestamps null: false
    end
  end
end
