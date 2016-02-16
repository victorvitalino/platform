class CreateFirmEnterpriseStatuses < ActiveRecord::Migration
  def change
    create_table :firm_enterprise_statuses do |t|
      t.references :cadastre, index: true#, foreign_key: true
      t.references :enterprise_cadastre, index: true#, foreign_key: true
      t.references :status_cadastre, index: true#, foreign_key: true
      t.text :observation
      t.string :archive_file

      t.timestamps null: false
    end
  end
end
