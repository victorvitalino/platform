class CreateProtocolControlInteresteds < ActiveRecord::Migration
  def change
    create_table :protocol_control_interesteds do |t|
      t.string :name
      t.string :cpf
      t.string :foundation
      t.string :address
      t.references :state, index: true#, foreign_key: true
      t.references :city, index: true#, foreign_key: true
      t.string :cep
      t.string :email
      t.string :telephone
      t.string :fax
      t.integer :interested_type
      t.references :staff, index: true#, foreign_key: true
      t.references :control, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
