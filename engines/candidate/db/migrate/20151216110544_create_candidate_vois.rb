class CreateCandidateVois < ActiveRecord::Migration
  def change
    create_table :candidate_vois do |t|
      t.string :name
      t.string :address
      t.string :cpf
      t.string :rg
      t.integer :situation, default: 0

      t.timestamps null: false
    end
  end
end
