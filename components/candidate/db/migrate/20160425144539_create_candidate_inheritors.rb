class CreateCandidateInheritors < ActiveRecord::Migration
  def change
    create_table :candidate_inheritors do |t|
      t.references :cadastre, index: true#, foreign_key: true
      t.string :name
      t.references :inheritor_type, index: true#, foreign_key: true
      t.string :cpf
      t.string :rg
      t.date :born
      t.references :civil_state, index: true#, foreign_key: true
      t.string :gender
      t.string :single_name
      t.decimal :percentage
      t.text :observation

      t.timestamps null: false
    end
  end
end
