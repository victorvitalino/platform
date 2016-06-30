class CreateSefazSendStatuses < ActiveRecord::Migration
  def change
    create_table :sefaz_send_statuses do |t|
      t.string :name
      t.string :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
