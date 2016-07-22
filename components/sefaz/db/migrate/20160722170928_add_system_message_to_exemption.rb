class AddSystemMessageToExemption < ActiveRecord::Migration
  def change
    add_column :sefaz_exemptions, :system_message, :string
  end
end
