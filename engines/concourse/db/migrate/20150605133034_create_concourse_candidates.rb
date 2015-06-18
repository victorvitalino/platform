class CreateConcourseCandidates < ActiveRecord::Migration
  def change
    create_table :concourse_candidates do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.string :cpf
      t.string :telphone
      t.string :celphone
      t.references :city, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.string :email
      t.string :password
      t.integer :status
      
      t.timestamps null: false
    end
  end
end
