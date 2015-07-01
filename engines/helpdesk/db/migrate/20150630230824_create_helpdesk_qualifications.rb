class CreateHelpdeskQualifications < ActiveRecord::Migration
  def change
    create_table :helpdesk_qualifications do |t|
      t.string :name
      t.boolean :status
      t.references :order_service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
