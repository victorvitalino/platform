class RenameZoneToZoneIdAllotments < ActiveRecord::Migration
  def change
    rename_column :indication_allotments, :zone, :zone_id
  end
end
