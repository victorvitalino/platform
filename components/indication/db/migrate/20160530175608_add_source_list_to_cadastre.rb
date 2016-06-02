class AddSourceListToCadastre < ActiveRecord::Migration
  def change
    add_column :indication_cadastres, :source_list, :string
  end
end
