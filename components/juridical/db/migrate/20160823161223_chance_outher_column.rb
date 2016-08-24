class ChanceOutherColumn < ActiveRecord::Migration
  def change
     change_column :juridical_legal_advices, :process_type, 'integer USING CAST(process_type AS integer)'
  end
end
