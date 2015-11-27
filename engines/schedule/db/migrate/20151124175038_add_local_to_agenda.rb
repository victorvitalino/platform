class AddLocalToAgenda < ActiveRecord::Migration
  def change
    add_column :schedule_agendas, :local, :string
  end
end
