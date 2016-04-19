class AddStaffToCadastreProcedural < ActiveRecord::Migration
  def change
    add_reference :candidate_cadastre_procedurals, :staff, index: true#, foreign_key: true
    add_column :candidate_cadastre_procedurals, :observation, :text#, foreign_key: true
  end
end
