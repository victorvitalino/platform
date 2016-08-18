class AddFamilyIncomeToDeficit < ActiveRecord::Migration
  def change
    add_column :info_center_deficits, :family_income, :integer
  end
end
