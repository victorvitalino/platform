class CreateCandidateEnterpriseCadastres < ActiveRecord::Migration
  def change
    create_table :candidate_enterprise_cadastres do |t|
      t.references :enterprise, index: true 
      t.references :cadastre, index: true 
      t.references :indication_cadastre, index: true
      t.date  :inactive_date
      t.boolean :inactive
      t.timestamps null: false
    end
  end
end
