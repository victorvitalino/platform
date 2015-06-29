class CreateConcourseEnrollmentCandidates < ActiveRecord::Migration
  def change
    create_table :concourse_enrollment_candidates do |t|
      t.references :enrollment, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.text :properties
      t.boolean :validated
      t.boolean :payment
      t.integer :status
      t.text :observation_validated
      t.text :dynamic_attributes
      
      t.timestamps null: false
    end
  end
end
