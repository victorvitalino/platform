class AddSituationToCadastreMirror < ActiveRecord::Migration
  def change
    add_column :candidate_cadastre_mirrors, :situation, :integer, default: 0
  end
end
