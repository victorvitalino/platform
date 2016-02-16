class AddUserCompanyToEnterpriseStatus < ActiveRecord::Migration
  def change
    add_reference :firm_enterprise_statuses, :user_company, index: true#, foreign_key: true
  end
end
