class AddYearActToExemptions < ActiveRecord::Migration
  def change
    add_column :sefaz_exemptions, :year_act, :integer
    add_column :sefaz_exemptions, :number_act_to_cancel, :string
  end
end
