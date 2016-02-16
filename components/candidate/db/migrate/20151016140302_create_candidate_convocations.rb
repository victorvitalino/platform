class CreateCandidateConvocations < ActiveRecord::Migration
  def change
    create_table :candidate_convocations do |t|
      t.string :description
      t.date :date_start
      t.date :date_end
      
      t.integer :quantity, default: 0
      t.text    :criteria
      t.boolean :status
      t.string  :year_month
      
      t.references :pontuation_code, index: true
      
      t.integer :pontuation_start, default: 0
      t.integer :pontuation_end, default: 0

      t.timestamps null: false
    end
  end
end
