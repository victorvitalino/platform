class CreatePersonSystemPermissions < ActiveRecord::Migration
  def change
    create_table :person_system_permissions do |t|
      t.string :action
      t.string :code
      t.boolean :status
      t.references :system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
