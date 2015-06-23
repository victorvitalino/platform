class CreateConcourseCandidateInformations < ActiveRecord::Migration
  def change
    create_table :concourse_candidate_informations do |t|
      t.references :candidate, index: true
      t.string  :field_type
      t.string  :field_name
      t.text    :field_value
      t.timestamps null: false
    end
  end
end
