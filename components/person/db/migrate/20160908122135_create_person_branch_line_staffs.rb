class CreatePersonBranchLineStaffs < ActiveRecord::Migration
  def change
    create_table :person_branch_line_staffs do |t|
      t.references :branch_line, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
