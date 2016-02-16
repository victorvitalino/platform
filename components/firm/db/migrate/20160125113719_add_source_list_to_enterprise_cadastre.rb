class AddSourceListToEnterpriseCadastre < ActiveRecord::Migration
  def change
    add_column :firm_enterprise_cadastres, :source_list, :string
  end
end
