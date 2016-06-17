class CreateVisitLiftings < ActiveRecord::Migration
  def change
    create_table :visit_liftings do |t|
      t.string :localization
      t.string :seal
      t.string :name
      t.string :naturality
      t.boolean :sex
      t.date :born
      t.string :cpf
      t.string :rg
      t.string :rg_org
      t.date :rg_org_date
      t.string :phone
      t.string :celphone
      t.integer :retirement
      t.integer :benefit
      t.integer :pension
      t.string :nis
      t.string :income
      t.string :spouse_name
      t.date :spouse_born
      t.string :spouse_cpf
      t.string :spouse_rg
      t.string :spouse_rg_org
      t.date :spouse_rg_org_date
      t.integer :deficiency
      t.string :deficiency_specification
      t.integer :civil_status
      t.integer :lot_situation
      t.string :lot_situation_time
      t.integer :busy_lot
      t.integer :busy_lot_user
      t.integer :lot_vacated
      t.text :lot_vacated_description
      t.integer :business_activities
      t.text :business_activities_description
      t.integer :contractual_purpose
      t.text :contractual_purpose_description
      t.text :additional_information
      t.string :geolocation
      t.string :photo_one
      t.string :photo_two
      t.string :photo_three
      t.integer :voi

      t.timestamps null: false
    end
  end
end
