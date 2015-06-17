class CreateConcourseCandidateFields < ActiveRecord::Migration
  def change
    create_table :concourse_candidate_fields do |t|
      
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.string :field_type
      t.boolean :required
      t.boolean :unique
      t.string :regular_expression

      t.timestamps null: false
    end
  end
end
