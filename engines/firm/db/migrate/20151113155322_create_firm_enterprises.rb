class CreateFirmEnterprises < ActiveRecord::Migration
  def change
    create_table :firm_enterprises do |t|
      t.string :name
      t.decimal :value
      t.references :tipology, index: true#, foreign_key: true
      t.references :company, index: true#, foreign_key: true
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
