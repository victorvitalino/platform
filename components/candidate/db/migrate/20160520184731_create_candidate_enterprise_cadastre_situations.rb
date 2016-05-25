class CreateCandidateEnterpriseCadastreSituations < ActiveRecord::Migration
  def change
    create_table :candidate_enterprise_cadastre_situations do |t|
      t.references :enterprise_cadastre, index: {:name => "index_enterprise_cadastre_on_enterprise_cadastre_id"}
      t.references :enterprise_cadastre_status, index: {:name => "index_ent_cad_on_enterprise_cad_status_id"}
      t.text  :observation
      t.string  :file_path
      t.references  :firm_user, index: true
      t.timestamps null: false
    end
  end
end
