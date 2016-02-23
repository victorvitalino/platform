class AddCnpjToAgendaSchedule < ActiveRecord::Migration
  def change
    add_column :schedule_agenda_schedules, :cnpj, :string
  end
end
