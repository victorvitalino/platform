class CreateAttendanceCadastres < ActiveRecord::Migration
  def change
    create_table :attendance_cadastres do |t|
      
      t.integer   :cadastre_id,         index: true 
      t.integer   :cadastre_mirror_id,  index: true
      t.integer   :program_id,          index: true
      t.integer   :situation_id,        index: true
      t.integer   :staff_id,            index: true
      t.integer   :supervisor_id,       index: true
      t.integer   :attendance_type_id,  index: true 
      t.integer   :schedule_id,         index: true
      t.datetime  :start
      t.datetime  :end
      t.integer   :status,              default: 0
      t.integer   :canceler_id,         index: true
      t.datetime  :cancel_date
      t.text      :cancel_observation

      t.timestamps null: false
    end
  end
end
