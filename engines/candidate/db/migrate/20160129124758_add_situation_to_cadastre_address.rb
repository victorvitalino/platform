class AddSituationToCadastreAddress < ActiveRecord::Migration
  def change
    add_reference :candidate_cadastre_addresses, :situation, index: true#, foreign_key: true
    add_reference :candidate_cadastre_addresses, :staff, index: true#, foreign_key: true
    add_reference :candidate_cadastre_addresses, :user_company, index: true#, foreign_key: true
  end
end
