class CreateProjectEnterprises < ActiveRecord::Migration
  def change
    create_table :project_enterprises do |t|
      t.string  :name
      t.string  :value
      t.references :typology, index: true
      t.references :company, index: true
      t.boolean :status, default: true
      t.string :edict_number
      t.string :process_number
      t.integer :situation

      t.timestamps null: false
    end
  end
end
