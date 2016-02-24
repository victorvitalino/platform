class AddChecklistToCadastreMirror < ActiveRecord::Migration
  def change
    add_reference :candidate_cadastre_mirrors, :checklist, index: true
  end
end
