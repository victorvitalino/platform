class AddEnterpriseToUnit < ActiveRecord::Migration
  def change
    add_reference :address_units, :firm_enterprise, index: true#, foreign_key: true
  end
end
