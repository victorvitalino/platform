class AddOldToLegalAdvices < ActiveRecord::Migration
  def change
    add_reference :juridical_legal_advices, :old, index: true
  end
end
