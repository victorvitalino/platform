class AddLastSignedInAtToStaff < ActiveRecord::Migration
  def change
    add_column :person_staffs, :last_signed_in_at, :date
  end
end
