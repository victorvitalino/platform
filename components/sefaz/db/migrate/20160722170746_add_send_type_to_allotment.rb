class AddSendTypeToAllotment < ActiveRecord::Migration
  def change
    add_column :sefaz_allotments, :send_type, :integer
  end
end
