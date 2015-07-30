class CreateRegularizationRequeriments < ActiveRecord::Migration
  def change
    create_table :regularization_requeriments do |t|
      t.string  :name
      t.string  :cpf
      t.string  :rg
      t.date    :born
      t.string  :telephone
      t.string  :celphone
      t.string  :complete_address
      t.float   :income
      t.string  :spouse_name
      t.string  :spouse_cpf
      t.boolean :owner, default: false
      t.boolean :dont_owner, default: false
      
      t.references :unit, index: true
      t.timestamps null: false
    end
  end
end
