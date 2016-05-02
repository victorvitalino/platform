class AddDeskToLocation < ActiveRecord::Migration
  def change
    add_column :protocol_locations, :desk, :string
  end
end
