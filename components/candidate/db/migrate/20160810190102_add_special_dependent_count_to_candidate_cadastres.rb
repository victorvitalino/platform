class AddSpecialDependentCountToCandidateCadastres < ActiveRecord::Migration
  def change
    add_column :candidate_cadastres, :special_dependent_count, :integer
    add_column :candidate_cadastre_mirrors, :special_dependent_count, :integer
  end
end
