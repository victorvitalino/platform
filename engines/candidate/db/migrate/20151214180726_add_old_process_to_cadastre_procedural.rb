class AddOldProcessToCadastreProcedural < ActiveRecord::Migration
  def change
    add_column :candidate_cadastre_procedurals, :old_process, :string
  end
end
