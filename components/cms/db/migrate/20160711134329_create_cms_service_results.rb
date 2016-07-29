class CreateCmsServiceResults < ActiveRecord::Migration
  def change
    create_table :cms_service_results do |t|
      t.integer :program_morarbem
      t.integer :regularization
      t.integer :contract
      t.integer :ombudsman
      t.integer :protocol
      t.date :date
      t.boolean :status

      t.timestamps null: false
    end
  end
end
