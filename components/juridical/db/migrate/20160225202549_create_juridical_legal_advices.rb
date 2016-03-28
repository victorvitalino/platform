class CreateJuridicalLegalAdvices < ActiveRecord::Migration
  def change
    create_table :juridical_legal_advices do |t|
      t.string :process_number
      t.string :agency
      t.references :lawsuit, index: true#, foreign_key: true
      t.decimal :lawsuit_value
      t.references :instancy_place, index: true#, foreign_key: true
      t.references :housing_program, index: true#, foreign_key: true
      t.references :document_type, index: true#, foreign_key: true
      t.references :responsible_lawyer, index: true#, foreign_key: true
      t.text :complement
      t.boolean :status
      t.date :start_date
      t.date :end_date
      t.boolean :process_type
      t.references :staff_id, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
