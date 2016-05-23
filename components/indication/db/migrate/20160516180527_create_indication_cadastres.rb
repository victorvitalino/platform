class CreateIndicationCadastres < ActiveRecord::Migration
  def change
    create_table :indication_cadastres do |t|
      
      t.references :allotment, index: true
      t.references :cadastre, index: true
      t.references :program, index: true 
      t.references :pontuation, index: true 
      t.integer    :situation, default: 0
      t.string     :observation
      t.string     :zone

      t.timestamps null: false
    end
  end
end
