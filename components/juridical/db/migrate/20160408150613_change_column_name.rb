class ChangeColumnName < ActiveRecord::Migration
  def change
     rename_column :juridical_legal_advices, :complement, :description_complement
  end
end
