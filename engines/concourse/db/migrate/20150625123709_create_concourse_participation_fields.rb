class CreateConcourseParticipationFields < ActiveRecord::Migration
  def change
    create_table :concourse_participation_fields do |t|
      t.references :participation, index: true, foreign_key: true
      t.string :name
      t.string :code
      t.integer :field_type
      t.boolean :required
      t.boolean :status

      t.timestamps null: false
    end
  end
end
