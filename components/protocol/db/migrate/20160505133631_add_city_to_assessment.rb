class AddCityToAssessment < ActiveRecord::Migration
  def change
    add_column :protocol_assessments, :city, :string
  end
end
