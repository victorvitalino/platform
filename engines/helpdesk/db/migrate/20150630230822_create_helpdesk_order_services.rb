class CreateHelpdeskOrderServices < ActiveRecord::Migration
  def change
    create_table :helpdesk_order_services do |t|
      t.string :prefix
      t.integer :number
      t.string :opened_by
      t.string :required_by
      t.references :sector, index: true, foreign_key: true
      t.references :branch_line, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
