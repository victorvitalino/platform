class CreateScheduleAgendas < ActiveRecord::Migration
  def change
    create_table :schedule_agendas do |t|
      
      t.string  :title
      t.text    :description
      t.string  :avatar
      t.date    :start
      t.date    :end
      t.text    :disable_dates
      t.time    :start_hour
      t.time    :end_hour
      t.integer :attendance_time, default: 15
      t.integer :attendants
      t.boolean :weekend, default: false
      t.boolean :lunch_time, default: false
      t.integer :lunch_attendants
      t.time    :lunch_start
      t.time    :lunch_end
      t.integer :restriction_type, default: 0
      t.text    :restriction_sql
      
      t.references :program, index: true
      t.references :staff, index: true
      
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
