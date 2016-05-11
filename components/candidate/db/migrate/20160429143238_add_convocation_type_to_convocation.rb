class AddConvocationTypeToConvocation < ActiveRecord::Migration
  def change
    add_column :candidate_convocations, :convocation_type, :integer
  end
end
