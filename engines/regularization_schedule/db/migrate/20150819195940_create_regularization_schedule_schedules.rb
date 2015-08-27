class CreateRegularizationScheduleSchedules < ActiveRecord::Migration
  def change
    create_table :regularization_schedule_schedules do |t|
      t.references :agenda, index: true #,foreign_key: true
      t.references :requeriment, index: true #,foreign_key: true
      t.string :cpf
      t.boolean :status
      t.date :date_schedule
      t.time :hour_schedule
      t.text :observation

      t.timestamps null: false
    end
  end
end
