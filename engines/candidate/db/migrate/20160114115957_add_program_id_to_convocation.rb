class AddProgramIdToConvocation < ActiveRecord::Migration
  def change
    add_column :candidate_convocations, :program_id, :integer
  end
end
