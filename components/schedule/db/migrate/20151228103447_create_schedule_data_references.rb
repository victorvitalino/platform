class CreateScheduleDataReferences < ActiveRecord::Migration
  def change
    create_table :schedule_data_references do |t|
      t.string :name
      t.string :cpf
      t.string :observation
      t.string :code, index: true

      t.timestamps null: false
    end
  end
end
