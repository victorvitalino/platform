class CreateEntityMembers < ActiveRecord::Migration
  def change
    create_table :entity_members do |t|
      t.references :cadastre, index: true
      t.string :name
      t.string :cpf
      t.string :rg 
      t.string :rg_org
      t.string :address
      t.references :city, index: true
      t.string :cep
      t.string :email
      t.date :start
      t.date :end
      t.date :born
      t.string :telephone
      t.string :telephone_optional
      t.string :celphone
      t.string :certificate_civil_criminal
      t.string :photo
      t.boolean :status, default: true
      t.references :member_job, index: true

      t.timestamps null: false
    end
    add_index :entity_members, [:cpf, :cadastre_id], unique: true
  end
end
