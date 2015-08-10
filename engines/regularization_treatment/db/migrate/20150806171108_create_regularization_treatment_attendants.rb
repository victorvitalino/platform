class CreateRegularizationTreatmentAttendants < ActiveRecord::Migration
  def change
    create_table :regularization_treatment_attendants do |t|
      t.references :staff, index: true#, foreign_key: true
      t.references :service_station, index: true#, foreign_key: true
      t.integer :counter
      t.integer :privilege, default: 0

      t.timestamps null: false
    end
  end
end
