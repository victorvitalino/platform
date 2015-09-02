class CreateCandidateConvocations < ActiveRecord::Migration
  def change
    create_table :candidate_convocations do |t|
      t.text    :description
      t.date    :start
      t.date    :end
      t.integer :quantity
      t.text    :discretion
      t.boolean :stauts, default: true
      t.integer :tipe
      t.string  :legacy_pontuation
      t.references :pontuation, index: true
      t.references :city, index: true
      t.timestamps null: false
    end
  end
end
