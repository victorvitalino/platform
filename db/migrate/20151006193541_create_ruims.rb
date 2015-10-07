class CreateRuims < ActiveRecord::Migration
  def change
    create_table :ruims do |t|
      t.string :name
      t.string :cpf
      t.string :seqcad
      t.string :motivo
      t.string :type_scope
      t.timestamps null: false
    end
  end
end
