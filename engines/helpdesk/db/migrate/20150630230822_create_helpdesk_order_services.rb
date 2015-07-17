class CreateHelpdeskOrderServices < ActiveRecord::Migration
  def change
    create_table :helpdesk_order_services do |t|
      t.integer :number
      t.integer :number_increment
      t.integer :qualification
      t.string  :subject
<<<<<<< HEAD
      t.integer :category
      t.integer :status

      t.references :sector, index: true, foreign_key: true
      t.references :branch_line, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true
      t.references :opened_by, index: true, foreign_key: true
      t.references :responsible, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true
        
=======
      t.references :sector, index: true#, foreign_key: true
      t.references :branch_line, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true
      t.references :opened_by, index: true#, foreign_key: true
      t.references :responsible, index: true#, foreign_key: true
      t.references :good, index: true#, foreign_key: true
      t.references :category, index: true#, foreign_key: true
      t.references :status, index: true#, foreign_key: true
      
>>>>>>> 607d66cf207cc0d6f3df30a0abe8285e0d223ebc

      t.timestamps null: false
    end
  end
end
