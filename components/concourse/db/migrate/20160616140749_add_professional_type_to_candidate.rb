class AddProfessionalTypeToCandidate < ActiveRecord::Migration
  def change
    add_column :concourse_candidates, :professional_type, :integer
  end
end
