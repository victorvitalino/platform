class CreatePersonUserPermissons < ActiveRecord::Migration
  def change
    create_table :person_user_permissons do |t|
      t.references :user, index: true, foreign_key: true
      t.references :system_permission, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
