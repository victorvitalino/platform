class AddContractDeliveredToUnits < ActiveRecord::Migration
  def change
    add_column :address_units, :contract_delivered, :boolean
    add_column :address_units, :contract_delivered_date, :datetime
  end
end
