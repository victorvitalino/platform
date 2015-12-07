class AddCpfToAttendance < ActiveRecord::Migration
  def change
    add_column :candidate_attendances, :cpf, :string
  end
end
