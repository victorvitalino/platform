class AddBranchLineToStaff < ActiveRecord::Migration
  def change
    add_column :person_staffs, :branch_line, :string
  end
end
