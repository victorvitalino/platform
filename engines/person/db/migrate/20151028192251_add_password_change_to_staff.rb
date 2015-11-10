class AddPasswordChangeToStaff < ActiveRecord::Migration
  def change
    add_column :person_staffs, :password_change, :date
  end
end
