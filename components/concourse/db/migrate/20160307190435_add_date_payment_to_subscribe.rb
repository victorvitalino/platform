class AddDatePaymentToSubscribe < ActiveRecord::Migration
  def change
    add_column :concourse_subscribes, :date_payment, :date
  end
end
