class AddRegularizationTypeToCadastreAddress < ActiveRecord::Migration
  def change
    add_reference :candidate_cadastre_addresses, :regularization_type, index: true
  end
end
