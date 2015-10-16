class CreateSefazTransmissions < ActiveRecord::Migration
  def change
    create_table :sefaz_transmissions do |t|
  
      t.references  :staff, index: true
      t.string      :sector
      t.string      :exemption_type
      t.integer     :quantity, default: 0
      t.integer     :status, default: 0
      t.string      :csv
      t.string      :xml
      t.string      :sefaz_protocol
   
      
      t.datetime    :sent_in
  
      t.timestamps null: false
    end
  end
end
