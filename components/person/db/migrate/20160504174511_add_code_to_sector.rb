class AddCodeToSector < ActiveRecord::Migration
  def change
    add_column :person_sectors, :code, :string
  end
end
