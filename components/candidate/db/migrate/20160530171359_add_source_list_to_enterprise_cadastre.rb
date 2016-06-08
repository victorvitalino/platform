class AddSourceListToEnterpriseCadastre < ActiveRecord::Migration
  def change
    add_column :candidate_enterprise_cadastres, :source_list, :string
    add_column :candidate_enterprise_cadastres, :zone, :integer
  end
end
