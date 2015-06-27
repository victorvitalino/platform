class CreateConcourseCandidates < ActiveRecord::Migration
  def change
    create_table :concourse_candidates do |t|
      t.string :name
      t.string :cpf
      t.string :telphone
      t.string :telphone_optional
      t.string :celphone
      t.string :cep
      t.string :address
      t.references :city, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.string :email
      t.integer :sex
      t.boolean :status

      t.timestamps null: false
    end
  end
end
