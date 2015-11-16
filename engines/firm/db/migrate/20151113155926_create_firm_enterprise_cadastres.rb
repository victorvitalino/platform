class CreateFirmEnterpriseCadastres < ActiveRecord::Migration
  def change
    create_table :firm_enterprise_cadastres do |t|
      t.references :enterprise, index: true#, foreign_key: true
      t.references :cadastre, index: true#, foreign_key: true
      t.references :status_cadastre, index: true#, foreign_key: true
      t.text :observation
      t.string :archive_path

      t.timestamps null: false
    end
  end
end
