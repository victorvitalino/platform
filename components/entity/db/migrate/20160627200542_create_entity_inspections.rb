class CreateEntityInspections < ActiveRecord::Migration
  def change
    create_table :entity_inspections do |t|
      t.references :cadastre, index: true
      t.string :address_optional
      t.string :general_photo_1
      t.string :general_photo_2
      t.string :general_photo_3
      t.string :size
      t.integer :property_type
      t.string :property_owner
      t.text :others_local
      t.string :operating_time
      t.string :location_time
      t.string :meeting_frequency
      t.string :elected
      t.string :action_area
      t.string :associated_amount
      t.string :business_hour
      t.string :business_days
      t.integer :inspection_type
      t.string :attorney
      t.string :documentation_photo_1
      t.string :documentation_photo_2
      t.string :responsible_name
      t.string :responsible_cpf
      t.string :responsible_rg
      t.string :responsible_title
      t.string :responsible_photo
      t.string :responsible_phone
      t.integer :occupied_property
      t.text :additional_information
      t.string :attorney_name
      t.text :property_description
      t.date :current_elected

      t.timestamps null: false
    end
  end
end
