class CreateEntitySurveys < ActiveRecord::Migration
  def change
    create_table :entity_surveys do |t|

      t.integer :cadastre_id, index: true
      t.integer :situation

      t.string    :address 
      t.string    :number 
      
      t.integer   :city_id 
      

      #fields

      t.integer :property_type
      t.integer :property_size
      t.integer :property_structure

      t.string  :property_owner 
      t.integer :property_occupied

      t.text    :property_description
      t.text    :property_entities

      t.string  :operation_time
      t.string  :property_time 
      t.string  :reunions_frequency

      t.date    :date_election_president
      t.string  :operation_area
      t.integer :members_count
      t.string  :operation_hour
      t.string  :operation_days
      
      t.string  :representation_job_codhab
      t.string  :representation_name
      t.string  :representation_cpf
      t.string  :representation_rg
      
      t.integer :representation_job
      t.integer :representation_telephone

      t.timestamps null: false
    end
  end
end
