class AddProgramIdToList < ActiveRecord::Migration
  def change
    add_column :candidate_lists, :program_id, :integer
  end
end
