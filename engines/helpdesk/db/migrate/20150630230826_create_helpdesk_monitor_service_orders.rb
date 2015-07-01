class CreateHelpdeskMonitorServiceOrders < ActiveRecord::Migration
  def change
    create_table :helpdesk_monitor_service_orders do |t|
      t.text :appointment
      t.string :attachment
      t.string :user
      t.boolean :status
      t.references :order_service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
