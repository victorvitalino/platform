class AddNetworkPathToLocation < ActiveRecord::Migration
  def change
      add_column :protocol_locations, :network_path, :string
  end
end
