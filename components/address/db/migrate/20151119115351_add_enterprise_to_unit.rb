class AddEnterpriseToUnit < ActiveRecord::Migration
  def change
    add_reference :address_units, :project_enterprise, index: true#, foreign_key: true
  end
end
