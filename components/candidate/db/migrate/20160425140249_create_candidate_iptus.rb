class CreateCandidateIptus < ActiveRecord::Migration
  def change
    create_table :candidate_iptus do |t|
      t.string :cpf
      t.string :name
      t.string :registration
      t.string :address
      t.string :city
      t.string :kind_realty
      t.string :kind_search
      t.string :year
      t.boolean :realty_codhab

      t.timestamps null: false
    end
  end
end
