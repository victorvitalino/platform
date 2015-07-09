class CreateProtocolAssessments < ActiveRecord::Migration
  def change
    create_table :protocol_assessments do |t|
      t.integer :number
      t.integer :year
      t.integer :prefex
      t.string :document_number
      t.string :external_number
      t.string :requesting_unit
      t.string :external_agency
      t.string :recipient
      t.string :address
      t.string :cpf
      t.string :cnpj
      t.string :sign_by
      t.text :observation
      t.text :description_subject
      t.references :document_type, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.references :staaff, index: true, foreign_key: true
      t.references :setor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
