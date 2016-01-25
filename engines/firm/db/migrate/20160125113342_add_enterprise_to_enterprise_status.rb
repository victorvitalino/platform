class AddEnterpriseToEnterpriseStatus < ActiveRecord::Migration
  def change
    add_reference :firm_enterprise_statuses, :enterprise, index: true#, foreign_key: true
  end
end
