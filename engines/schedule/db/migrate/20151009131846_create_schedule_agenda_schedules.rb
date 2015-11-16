class CreateScheduleAgendaSchedules < ActiveRecord::Migration
  def change
    create_table :schedule_agenda_schedules do |t|
      t.references :agenda, index: true
      
      t.date       :date
      t.time       :hour
      t.date       :born
      t.string     :name
      t.string     :cpf
      t.string     :email
      t.string     :telephone
      t.string     :telephone_optional
      t.string     :celphone
      t.string     :observation
      
      t.text       :attendant_observation
      t.integer    :status, default: 0

      t.references :city, index: true

      t.timestamps null: false
    end
  end
end
