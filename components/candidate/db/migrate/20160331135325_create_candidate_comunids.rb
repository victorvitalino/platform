class CreateCandidateComunids < ActiveRecord::Migration
  def change
    create_table :candidate_comunids do |t|
      t.string :code
      t.string :block
      t.string :group
      t.string :unit
      t.string :condominium
      t.string :sector
      t.integer :seal
      t.string :code_letter
      t.string :condition_interview
      t.string :outher_condition
      t.string :main_name
      t.string :main_rg
      t.string :main_cpf
      t.string :main_born
      t.string :main_uf_born
      t.string :main_telephone
      t.string :telephone_type
      t.string :main_nationality
      t.integer :total_family
      t.string :interviewed
      t.string :interviewed_rg
      t.string :interviewed_position

      t.string :residence_time
      t.string :residence_time_cond
      t.string :special_needs
      t.string :name_single_spouse
      t.string :residence_use
      t.string :construction_type
      t.string :number_floor
      t.string :rent_value
      t.string :water_supply
      t.string :water_box
      t.string :sewer
      t.string :bath_condition
      t.string :celeta_garbage
      t.string :eletrical_energy
      t.string :energy_standart
      t.string :energy_standart_situation
      t.string :flood
      t.string :mail_receive
      t.string :mail_box

      t.timestamps null: false
    end
  end
end
