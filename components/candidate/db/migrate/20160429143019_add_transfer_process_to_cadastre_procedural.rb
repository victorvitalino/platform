class AddTransferProcessToCadastreProcedural < ActiveRecord::Migration
  def change
    add_column :candidate_cadastre_procedurals, :transfer_process, :string
    add_reference :candidate_cadastre_procedurals, :transfer_assessment, index: true
  end
end
