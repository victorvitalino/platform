class AddModelNameToCandidateCadastreOccurrence < ActiveRecord::Migration
  def change
    add_column :candidate_cadastre_occurrences, :target_model_name,     :string
    add_column :candidate_cadastre_occurrences, :target_model_function, :string
    add_column :candidate_cadastre_occurrences, :target_model_id,       :integer
  end
end
