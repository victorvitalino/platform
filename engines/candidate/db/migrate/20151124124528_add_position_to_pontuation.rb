class AddPositionToPontuation < ActiveRecord::Migration
  def change
    add_column :candidate_pontuations, :position, :integer
  end
end
