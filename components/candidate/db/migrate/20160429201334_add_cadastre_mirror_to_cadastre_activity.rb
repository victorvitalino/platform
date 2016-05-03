class AddCadastreMirrorToCadastreActivity < ActiveRecord::Migration
  def change
    add_reference :candidate_cadastre_activities, :cadastre_mirror, index: true#, foreign_key: true
  end
end
