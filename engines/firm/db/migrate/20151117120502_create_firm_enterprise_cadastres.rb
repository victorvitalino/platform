class CreateFirmEnterpriseCadastres < ActiveRecord::Migration
  def change
    create_table :firm_enterprise_cadastres do |t|
      t.references :enterprise, index: true#, foreign_key: true
      t.references :cadastre, index: true#, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
