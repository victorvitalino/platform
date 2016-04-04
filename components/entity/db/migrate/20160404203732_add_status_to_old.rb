class AddStatusToOld < ActiveRecord::Migration
  def change
    add_column :entity_olds, :old, :string
  end
end
