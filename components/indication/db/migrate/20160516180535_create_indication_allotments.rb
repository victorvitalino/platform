class CreateIndicationAllotments < ActiveRecord::Migration
  def change
    create_table :indication_allotments do |t|

      t.references :step, index: true 

      t.integer    :zone, index: true
      t.integer    :demand
      t.integer    :rii
      t.integer    :rie
      t.integer    :old
      t.integer    :special
      t.integer    :vulnerable
      t.integer    :situation, default: 0
      t.references :staff, index: true 
      t.references :supervisor, index: true
       
      t.text :observation
      t.boolean :status 

      t.timestamps null: false
    end
  end
end
