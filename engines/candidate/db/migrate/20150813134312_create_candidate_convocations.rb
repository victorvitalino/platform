class CreateCandidateConvocations < ActiveRecord::Migration
  def change
    create_table :candidate_convocations do |t|
      t.string    :description
      t.text      :criterion
      t.date  :start
      t.date  :end
      t.integer :quantity
      t.boolean :status, default: true
      t.integer :convocation_type, default: 0
      t.string  :legacy_pontuation
      t.timestamps null: false
    end
  end
end
