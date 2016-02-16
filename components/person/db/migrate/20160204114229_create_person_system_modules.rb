class CreatePersonSystemModules < ActiveRecord::Migration
  def change
    create_table :person_system_modules do |t|
      t.string :title
      t.string :code

      t.timestamps null: false
    end
  end
end
