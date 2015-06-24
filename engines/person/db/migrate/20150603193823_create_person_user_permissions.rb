class CreatePersonUserPermissions < ActiveRecord::Migration
  def change
    create_table :person_user_permissions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :system_permission, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
