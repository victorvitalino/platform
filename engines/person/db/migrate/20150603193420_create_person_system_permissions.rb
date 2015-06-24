class CreatePersonSystemPermissions < ActiveRecord::Migration
  def change
    create_table :person_system_permissions do |t|
      t.string :action
      t.integer :code, unique: true
      t.boolean :status
      t.references :system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
