class CreateFirmStatusCadastres < ActiveRecord::Migration
  def change
    create_table :firm_status_cadastres do |t|
      t.string :name
      t.boolean :status, default: true
      t.string :type_status

      t.timestamps null: false
    end
  end
end
