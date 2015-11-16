class CreateSefazTransmissionCandidates < ActiveRecord::Migration
  def change
    create_table :sefaz_transmission_candidates do |t|

      t.references :transmission, index: true
      t.string  :sector
      t.string  :exemption_type
      t.string  :organization
      t.string  :cnpj
      t.string  :name
      t.string  :cpf
      t.string  :city
      t.string  :address
      t.string  :unit_code
      t.string   :unit_value
      t.integer     :status, default: 0
      t.string      :declaratory_act

      t.timestamps null: false
    end
  end
end
