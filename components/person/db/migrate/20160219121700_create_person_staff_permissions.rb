class CreatePersonStaffPermissions < ActiveRecord::Migration
  def change
    create_table :person_staff_permissions do |t|
      t.references :system, index: true#, foreign_key: true
      t.references :system_permission, index: true#, foreign_key: true
      t.references :system_module, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
