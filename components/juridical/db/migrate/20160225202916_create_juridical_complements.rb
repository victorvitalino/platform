class CreateJuridicalComplements < ActiveRecord::Migration
  def change
    create_table :juridical_complements do |t|
      t.references :document_type, index: true#, foreign_key: true
      t.references :lawsuit_type, index: true#, foreign_key: true
      t.references :instancy_place, index: true#, foreign_key: true
      t.date :distribuition_date
      t.date :deadline
      t.integer :days
      t.date :end_date
      t.text :complement
      t.references :responsible_lawyer, index: true#, foreign_key: true
      t.references :advice_type, index: true#, foreign_key: true
      t.string :file_path
      t.boolean :status
      t.references :complement_father_id, index: true#, foreign_key: true
      t.references :legal_advice_id, index: true#, foreign_key: true
      t.references :staff_id, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
