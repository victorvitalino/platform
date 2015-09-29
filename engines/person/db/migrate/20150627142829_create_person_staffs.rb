class CreatePersonStaffs < ActiveRecord::Migration
  def change
    create_table :person_staffs do |t|
      t.string :name
      t.string :cpf, unique: true
      t.string :rg,  unique: true
      t.string :rg_org
      t.string :code, unique: true
      t.string :blood_type
      t.date   :born
      t.string :avatar
      t.string :curriculum
      t.string :email,              null: false, default: ""
      t.time :start_hour
      t.time :end_hour
      t.date :date_contract
      t.date :date_shutdown
      t.boolean :wekeend
      t.boolean :status, default: true
      t.boolean :administrator, default: true
      t.integer :gender
      t.date :date_shutdown

      t.references :branch_line, index: true#, foreign_key: true
      t.references :job, index: true#, foreign_key: true
      t.references :sector_origin, index: true#, foreign_key: true
      t.references :sector_current, index: true#, foreign_key: true
      t.references :user_responsible, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
