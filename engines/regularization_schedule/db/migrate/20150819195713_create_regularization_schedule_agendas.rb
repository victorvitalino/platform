class CreateRegularizationScheduleAgendas < ActiveRecord::Migration
  def change
    create_table :regularization_schedule_agendas do |t|
      t.string :title
      t.text :description
      t.date :start
      t.date :end
      t.time :hour_start
      t.time :hour_end
      t.boolean :publish
      t.references :city, index: true#, foreign_key: true
      t.references :station, index: true#, foreign_key: true
      t.integer :quantity_attendants
      t.integer :time_attendant
      t.boolean :lunch
      t.date :lunch_start
      t.date :lunch_end
      t.integer :lunch_attendants
      t.integer :lunch_time_attendant
      t.string :validate_sql
      t.integer :validate_type
      t.boolean :validate_agenda

      t.timestamps null: false
    end
  end
end
