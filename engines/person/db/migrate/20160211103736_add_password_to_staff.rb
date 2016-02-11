class AddPasswordToStaff < ActiveRecord::Migration
  def change
     add_column :person_staffs, :password, :string
     add_column :person_staffs, :token, :string
     add_column :person_staffs, :token_status, :boolean, default: true
    
  end
end
