class CreateEntityOlds < ActiveRecord::Migration
  def change
    create_table :entity_olds do |t|
      t.string :name
      t.string :fantasy_name
      t.string :cnpj
      t.string :president_name
      t.string :president_cpf

      t.timestamps null: false
    end
  end
end
