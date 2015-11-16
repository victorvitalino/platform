class AddPrivilegeToStaff < ActiveRecord::Migration
  def change
    add_reference :person_staffs, :privilege, array: true
  end
end
