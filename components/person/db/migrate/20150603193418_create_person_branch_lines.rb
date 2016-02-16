class CreatePersonBranchLines < ActiveRecord::Migration
  def change
    create_table :person_branch_lines do |t|
      t.string :telephone
      t.string :description
      t.boolean :status

      t.references :sector, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
