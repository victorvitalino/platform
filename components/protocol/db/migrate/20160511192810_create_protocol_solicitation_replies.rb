class CreateProtocolSolicitationReplies < ActiveRecord::Migration
  def change
    create_table :protocol_solicitation_replies do |t|
      t.references :providence, index: true#, foreign_key: true
      t.date :providence_date
      t.references :providence_staff, index: true#, foreign_key: true
      t.boolean :process_delivered
      t.date :delivered_date
      t.references :responsible_delivered, index: true#, foreign_key: true
      t.text :observation
      t.references :authenticate, index: true#, foreign_key: true
      t.date :authenticate_date
      t.references :solicitation, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
