class CreateActionCadastres < ActiveRecord::Migration
  def change
    create_table :action_cadastres do |t|
      t.string :name
      t.string :cpf
      t.string :address
      t.string :nationality
      t.string :password
      t.string :email
      t.string :phone
      t.date :born
      t.references :city, index: true
      t.references :state, index: true

      t.timestamps null: false
    end
  end
end
