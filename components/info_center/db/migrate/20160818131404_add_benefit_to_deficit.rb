class AddBenefitToDeficit < ActiveRecord::Migration
  def change
    add_column :info_center_deficits, :benefit, :integer
  end
end
