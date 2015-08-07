class CreateRegularizationTreatmentServiceStations < ActiveRecord::Migration
  def change
    create_table :regularization_treatment_service_stations do |t|
      t.string :name
      t.references :city, index: true#, foreign_key: true
      t.string :observation
      t.integer :station_type, default: 0
      t.references :conv, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
