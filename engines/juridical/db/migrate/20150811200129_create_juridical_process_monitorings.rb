class CreateJuridicalProcessMonitorings < ActiveRecord::Migration
  def change
    create_table :juridical_process_monitorings do |t|
      t.string :number_lawsuit
      t.string :number_administrative_process
      t.string :organ
      t.references :action_type, index: true#, foreign_key: true
      t.string :value_cause
      t.references :local_instance, index: true#, foreign_key: true
      t.string :part
      t.references :lawyer_responsible, index: true#, foreign_key: true
      t.text :complemet
      t.boolean :status
      t.date :initial_date
      t.date :end_date
      t.integer :process_type

      t.timestamps null: false
    end
  end
end
