class CreateCandidateCadins < ActiveRecord::Migration
  def change
    create_table :candidate_cadins do |t|
      t.string :number_control
      t.string :name
      t.date :born
      t.string :process
      t.references :occurrence_cadin, index: true#, foreign_key: true
      t.references :signed_instrument, index: true#, foreign_key: true
      t.string :place_birth
      t.string :uf_born
      t.string :address
      t.string :cep
      t.references :city, index: true#, foreign_key: true
      t.string :cpf
      t.string :rg
      t.date :distribution_date
      t.string :percentage
      t.text :observation
      t.boolean :espolio
      t.boolean :freedup

      t.timestamps null: false
    end
  end
end
