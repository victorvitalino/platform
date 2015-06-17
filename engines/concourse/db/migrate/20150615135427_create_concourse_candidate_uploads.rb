class CreateConcourseCandidateUploads < ActiveRecord::Migration
  def change
    create_table :concourse_candidate_uploads do |t|
      t.references :candidate, index: true
      t.string    :field_type
      t.string    :field_name
      t.string    :field_value
      t.timestamps null: false
    end
  end
end
